import 'package:analyzer/dart/analysis/results.dart';
import 'package:linting/src/analyzer/model/analyzed_result.dart';
import 'package:linting/src/analyzer/model/analyzer_config.dart';
import 'package:linting/src/analyzer/model/internal_resolved_unit_result.dart';

class LintingAnalyzer {
  const LintingAnalyzer();

  Future<AnalyzedResult> analyze(
    AnalyzerConfig config,
    ResolvedUnitResult resolvedUnitResult, {
    required String rootFolder,
    required String? filePath,
  }) async {
    if (resolvedUnitResult.state != ResultState.VALID ||
        filePath == null ||
        !resolvedUnitResult.path.endsWith('.dart') ||
        resolvedUnitResult.path.endsWith('.g.dart')) {
      // TODO: log?
      return AnalyzedResult(filePath: '', issues: []);
    }

    final internalResolvedUnitResult = InternalResolvedUnitResult(
      path: resolvedUnitResult.path,
      content: resolvedUnitResult.content,
      unit: resolvedUnitResult.unit,
      lineInfo: resolvedUnitResult.lineInfo,
    );
    // TODO: support ignore
    // TODO: exclude files
    final issues = config.rules
        .expand((rule) => rule.check(internalResolvedUnitResult))
        .toList();

    return AnalyzedResult(
      filePath: filePath,
      issues: issues,
    );
  }
}
