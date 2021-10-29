import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
// ignore: implementation_imports
import 'package:analyzer/src/dart/analysis/driver.dart';
import 'package:analyzer_plugin/channel/channel.dart';
import 'package:analyzer_plugin/protocol/protocol_common.dart' as plugin;
import 'package:analyzer_plugin/protocol/protocol_generated.dart' as plugin;
import 'package:linting/foundation.dart';

class AnalyzeCommandContext {
  final AnalysisOptions _analysisOptions;
  final Iterable<Rule> _rules;
  final AnalysisDriver _driver;
  final ResolvedUnitResult analysisResult;
  final PluginCommunicationChannel channel;
  final String? _optionKey;

  const AnalyzeCommandContext(
    this._analysisOptions,
    this._rules,
    this._driver,
    this.analysisResult,
    this.channel,
    this._optionKey,
  );

  Iterable<Rule> get rules {
    return _rules.where((rule) =>
        _analysisOptions.lintingRules(_optionKey).contains(rule.ruleId));
  }

  Iterable<String> get excludes {
    return _analysisOptions.analyzerExclude;
  }

  bool get isAnalyzed {
    return _driver.analysisContext?.contextRoot
            .isAnalyzed(analysisResult.path) ??
        false;
  }

  String? get rootFolder {
    return _driver.analysisContext?.contextRoot.root.path;
  }

  void sendAnalysisErrors(
    Iterable<plugin.AnalysisError> errors,
  ) {
    channel.sendNotification(plugin.AnalysisErrorsParams(
      analysisResult.path,
      errors.toList(),
    ).toNotification());
  }

  void sendPluginError(
    Exception exception,
    StackTrace stackTrace,
  ) {
    channel.sendNotification(plugin.PluginErrorParams(
      false,
      exception.toString(),
      stackTrace.toString(),
    ).toNotification());
  }
}

class AnalyzeCommand {
  final LintingAnalyzer _analyzer;

  const AnalyzeCommand(this._analyzer);

  Future<void> runCommand(AnalyzeCommandContext context) async {
    try {
      if (context.isAnalyzed) {
        final errors = await _analyze(context);
        context.sendAnalysisErrors(errors);
      } else {
        context.sendAnalysisErrors([]);
      }
    } on Exception catch (e, stackTrace) {
      context.sendPluginError(e, stackTrace);
    }
  }

  Future<Iterable<plugin.AnalysisError>> _analyze(
    AnalyzeCommandContext context,
  ) async {
    final analyzedResult = await _analyzer.analyze(
      AnalyzerConfig(
        rules: context.rules,
        excludes: context.excludes,
        rootFolder: context.rootFolder!,
      ),
      context.analysisResult,
      filePath: context.analysisResult.path,
    );

    return analyzedResult.issues.map((issue) => _convertToAnalysisError(issue));
  }

  plugin.AnalysisError _convertToAnalysisError(Issue issue) {
    plugin.AnalysisErrorSeverity _convertToAnalysisErrorSeverity(
      Severity severity,
    ) {
      switch (severity) {
        case Severity.error:
          return plugin.AnalysisErrorSeverity.ERROR;
        case Severity.warning:
          return plugin.AnalysisErrorSeverity.WARNING;
        case Severity.info:
          return plugin.AnalysisErrorSeverity.INFO;
      }
    }

    String _convertToFilePath(Uri? uri) {
      if (uri == null) {
        return '';
      }
      if (uri.scheme == 'file') {
        return uri.toFilePath();
      }

      return File(uri.path).absolute.path;
    }

    return plugin.AnalysisError(
      _convertToAnalysisErrorSeverity(issue.severity),
      plugin.AnalysisErrorType.LINT,
      plugin.Location(
        _convertToFilePath(issue.location.sourceUrl),
        issue.location.start.offset,
        issue.location.length,
        issue.location.start.line,
        issue.location.start.column,
        endLine: issue.location.end.line,
        endColumn: issue.location.end.column,
      ),
      issue.message,
      issue.ruleId,
      correction:
          '${issue.verboseMessage ?? ''} ${issue.suggestion?.replacement ?? ''}'
              .trim(),
      url: issue.documentation.toString(),
      hasFix: issue.suggestion != null,
    );
  }
}
