import 'dart:io';

import 'package:linting/linting.dart';
import 'package:linting_cli/src/commands/models/invalid_argument_exception.dart';
import 'package:linting_cli/src/reporter/analyze_reporter.dart';
import 'package:path/path.dart';

import 'models/base_command.dart';
import 'models/common_command_options.dart';

class AnalyzeCommand extends BaseCommand {
  static final String _reporter = 'reporter';

  final List<AnalyzeReporter> reporters;

  @override
  String get description => 'Collect rules violations';

  @override
  String get name => 'analyze';

  @override
  String get invocation =>
      '${runner!.executableName} $name [arguments] <directories>';

  AnalyzeCommand({required this.reporters}) {
    if (reporters.isEmpty) {
      throw Exception("reporters is empty!");
    }
    _addFlags();
  }

  @override
  Future<void> validateCommand() async {
    validateRootFolderOption();
    validateTargetDirectories();

    final reporters = this
        .reporters
        .where((reporter) => reporter.reporterId == argResults![_reporter]);
    if (reporters.isEmpty) {
      throw InvalidArgumentException(
        "Can't find ${argResults![_reporter]} reporter from reporters",
      );
    }
  }

  Future<AnalysisOptions> loadAnalysisOptions() async {
    final analysisOptionsFile = File(join(
      argResults![CommonCommandOptions.rootFolder],
      'analysis_options.yaml',
    ));
    if (!analysisOptionsFile.existsSync()) {
      throw Exception("Can't find $analysisOptionsFile");
    }

    final analysisOptions = await AnalysisOptionsLoader().loadFromFile(
      analysisOptionsFile,
    );
    if (analysisOptions.lintingRules.isEmpty) {
      throw Exception('linting.rules is empty on $analysisOptionsFile');
    }

    return analysisOptions;
  }

  @override
  Future<void> runCommand() async {
    final argResults = this.argResults;
    if (argResults == null) {
      return;
    }
    final analysisOptions = await loadAnalysisOptions();

    final rules = Linting.rules
        .where((rule) => analysisOptions.lintingRules.contains(rule.ruleId))
        .toList();
    if (rules.isEmpty) {
      throw Exception('The executable rules is empty.');
    }

    final foldersToAnalyze = argResults.rest;
    final rootFolder = argResults[CommonCommandOptions.rootFolder];

    final config = AnalyzerConfig(
      rules: rules,
      exclude: analysisOptions.analyzerExclude
        ..add(argResults[CommonCommandOptions.exclude]),
    );

    final analyzer = LintingAnalyzer();

    final resultList = <AnalyzedResult>[];
    for (final dirname in foldersToAnalyze) {
      final directory = Directory(dirname);
      final files = directory.listSync(recursive: true);

      for (final file in files) {
        final result = await _analyze(config, analyzer, file, rootFolder);
        resultList.add(result);
      }
    }

    final reporter = reporters
        .where((reporter) => reporter.reporterId == argResults[_reporter])
        .first;
    reporter.report(resultList);
  }

  Future<AnalyzedResult> _analyze(
    AnalyzerConfig config,
    LintingAnalyzer analyzer,
    FileSystemEntity file,
    String rootFolder,
  ) async {
    final filePath = file.path;
    final resolvedUnitResult = await FileResolver.resolve(filePath);
    return await analyzer.analyze(
      config,
      resolvedUnitResult,
      rootFolder: rootFolder,
      filePath: filePath,
    );
  }

  void _addFlags() {
    _usesReporterOption();
    usesRootFolderOption();
    usesExcludeOption();
  }

  void _usesReporterOption() {
    argParser
      ..addSeparator('')
      ..addOption(
        _reporter,
        abbr: 'r',
        help: 'The format of the output of the analysis.',
        valueHelp: reporters.first.reporterId,
        allowed: reporters.map((reporter) => reporter.reporterId),
        defaultsTo: reporters.first.reporterId,
      );
  }
}
