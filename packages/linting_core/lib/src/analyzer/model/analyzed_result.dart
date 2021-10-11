import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linting/src/analyzer/model/issue.dart';

part 'analyzed_result.freezed.dart';

@freezed
class AnalyzedResult with _$AnalyzedResult {
  const factory AnalyzedResult({
    required String filePath,
    required List<Issue> issues,
  }) = _AnalyzedResult;
}
