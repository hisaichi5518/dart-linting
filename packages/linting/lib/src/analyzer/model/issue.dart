import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linting/src/analyzer/model/replacement.dart';
import 'package:source_span/source_span.dart';

part 'issue.freezed.dart';

@freezed
class Issue with _$Issue {
  const factory Issue({
    required String ruleId,
    required Uri documentation,
    required SourceSpan location,
    required Severity severity,
    required String message,
    String? verboseMessage,
    Replacement? suggestion,
  }) = _Issue;
}
