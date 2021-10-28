import 'package:freezed_annotation/freezed_annotation.dart';

import 'issue.dart';

part 'analyzed_result.freezed.dart';

@freezed
class AnalyzedResult with _$AnalyzedResult {
  const factory AnalyzedResult({
    required String filePath,
    required Iterable<Issue> issues,
  }) = _AnalyzedResult;
}
