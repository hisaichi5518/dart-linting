import 'package:analyzer/dart/analysis/results.dart';
import 'package:glob/glob.dart';
import 'package:linting/src/analyzer/model/analyzed_result.dart';
import 'package:linting/src/analyzer/model/analyzer_config.dart';
import 'package:linting/src/analyzer/model/internal_resolved_unit_result.dart';

import 'model/suppression.dart';

class LintingAnalyzer {
  const LintingAnalyzer();

  Future<AnalyzedResult> analyze(
    AnalyzerConfig config,
    ResolvedUnitResult resolvedUnitResult, {
    required String? filePath,
  }) async {
    if (resolvedUnitResult.state != ResultState.VALID ||
        filePath == null ||
        !resolvedUnitResult.path.endsWith('.dart') ||
        _isExcluded(resolvedUnitResult.path, config.excludePatterns)) {
      // TODO: log?
      return AnalyzedResult(filePath: '', issues: []);
    }

    final suppression = Suppression(
      resolvedUnitResult.content,
      resolvedUnitResult.lineInfo,
    );

    final internalResolvedUnitResult = InternalResolvedUnitResult(
      path: resolvedUnitResult.path,
      content: resolvedUnitResult.content,
      unit: resolvedUnitResult.unit,
      lineInfo: resolvedUnitResult.lineInfo,
    );

    final issues = config.rules
        .where((rule) => !suppression.isSuppressed(rule.ruleId))
        .expand((rule) => rule
            .check(
              internalResolvedUnitResult,
            )
            .where(
              (issue) => !suppression.isSuppressedAt(
                rule.ruleId,
                issue.location.start.line,
              ),
            ))
        .toList();

    return AnalyzedResult(
      filePath: filePath,
      issues: issues,
    );
  }

  bool _isExcluded(String? absolutePath, Iterable<Glob> excludes) {
    final path = absolutePath?.replaceAll(r'\', '/');
    return path != null && excludes.any((exclude) => exclude.matches(path));
  }
}
