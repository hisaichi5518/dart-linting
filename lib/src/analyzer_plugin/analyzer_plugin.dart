import 'dart:async';
import 'dart:io';

import 'package:analyzer/dart/analysis/context_builder.dart';
import 'package:analyzer/dart/analysis/context_locator.dart';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/file_system/physical_file_system.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/analysis/driver.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/analysis/driver_based_analysis_context.dart';
import 'package:analyzer_plugin/plugin/plugin.dart';
import 'package:analyzer_plugin/protocol/protocol_generated.dart' as plugin;
import 'package:linting/foundation.dart';
import 'package:linting/src/analyzer_plugin/commands/analyze_command.dart';

class LintingAnalyzerPlugin extends ServerPlugin {
  final Iterable<Rule> rules;
  final AnalyzeCommand analyzeCommand;
  final String? optionKey;

  @override
  final String contactInfo;

  @override
  final List<String> fileGlobsToAnalyze;

  @override
  final String name;

  @override
  final String version;

  LintingAnalyzerPlugin({
    required this.rules,
    required this.analyzeCommand,
    this.contactInfo = '',
    this.fileGlobsToAnalyze = const ['*.dart'],
    this.name = 'LintingAnalyzerPlugin',
    this.version = '1.0.0-alpha.0',
    this.optionKey,
  }) : super(PhysicalResourceProvider.INSTANCE);

  @override
  void contentChanged(String path) {
    super.driverForPath(path)?.addFile(path);
  }

  @override
  AnalysisDriverGeneric createAnalysisDriver(plugin.ContextRoot contextRoot) {
    final rootPath = contextRoot.root;
    final locator = ContextLocator(
      resourceProvider: resourceProvider,
    ).locateRoots(
      includedPaths: [rootPath],
      excludedPaths: contextRoot.exclude,
      optionsFile: contextRoot.optionsFile,
    );

    if (locator.isEmpty) {
      final error = _sendStateErrorNotification('Unexpected empty context');
      throw error;
    }

    final builder = ContextBuilder(resourceProvider: resourceProvider);
    final context = builder.createContext(contextRoot: locator.first)
        as DriverBasedAnalysisContext;
    final dartDriver = context.driver;

    final options = _loadAnalysisOptions(contextRoot.optionsFile, optionKey);

    runZonedGuarded(
      () {
        dartDriver.results.listen((analysisResult) {
          if (analysisResult is ErrorsResult && analysisResult.errors.isEmpty) {
            dartDriver.getResult(analysisResult.path);
          } else if (analysisResult is ResolvedUnitResult) {
            analyzeCommand.runCommand(
              AnalyzeCommandContext(
                options,
                rules,
                dartDriver,
                analysisResult,
                channel,
                optionKey,
              ),
            );
          }
        });
      },
      (e, stackTrace) {
        channel.sendNotification(
          plugin.PluginErrorParams(false, e.toString(), stackTrace.toString())
              .toNotification(),
        );
      },
    );

    return dartDriver;
  }

  AnalysisOptions _loadAnalysisOptions(String? optionsFile, String? optionKey) {
    if (optionsFile == null) {
      final error = _sendStateErrorNotification("Can't find options file");
      throw error;
    }

    final analysisOptionsFile = File(optionsFile);
    if (!analysisOptionsFile.existsSync()) {
      final error = _sendStateErrorNotification(
        "Can't find $analysisOptionsFile",
      );
      throw error;
    }

    final analysisOptions = AnalysisOptionsLoader().loadFromFile(
      analysisOptionsFile,
    );
    if (analysisOptions.lintingRules(optionKey).isEmpty) {
      final error = _sendStateErrorNotification(
        '${optionKey ?? 'linting'}.rules is empty on $analysisOptionsFile',
      );
      throw error;
    }

    return analysisOptions;
  }

  StateError _sendStateErrorNotification(String message) {
    final error = StateError(message);
    channel.sendNotification(plugin.PluginErrorParams(
      true,
      error.message,
      error.stackTrace.toString(),
    ).toNotification());
    return error;
  }
}
