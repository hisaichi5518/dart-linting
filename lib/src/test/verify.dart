import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:linting/foundation.dart';
import 'package:test/test.dart';

void verifyInitialization({
  required Iterable<Issue> issues,
  required String ruleId,
  required Severity severity,
}) {
  expect(issues.every((issue) => issue.ruleId == ruleId), isTrue);
  expect(issues.every((issue) => issue.severity == severity), isTrue);
}

void verifyIssues({
  required Iterable<Issue> issues,
  Iterable<int>? startOffsets,
  Iterable<int>? startLines,
  Iterable<int>? startColumns,
  Iterable<int>? endOffsets,
  Iterable<String>? locationTexts,
  Iterable<String>? messages,
  Iterable<String>? replacements,
  Iterable<String>? replacementComments,
}) {
  if (startOffsets != null) {
    expect(
      issues.map((issue) => issue.location.start.offset),
      equals(startOffsets),
      reason: 'incorrect start offset',
    );
  }

  if (startLines != null) {
    expect(
      issues.map((issue) => issue.location.start.line),
      equals(startLines),
      reason: 'incorrect start line',
    );
  }

  if (startColumns != null) {
    expect(
      issues.map((issue) => issue.location.start.column),
      equals(startColumns),
      reason: 'incorrect start column',
    );
  }

  if (endOffsets != null) {
    expect(
      issues.map((issue) => issue.location.end.offset),
      equals(endOffsets),
      reason: 'incorrect end offset',
    );
  }

  if (locationTexts != null) {
    expect(
      issues.map((issue) => issue.location.text),
      equals(locationTexts),
      reason: 'incorrect location text',
    );
  }

  if (messages != null) {
    expect(
      issues.map((issue) => issue.message),
      equals(messages),
      reason: 'incorrect message',
    );
  }

  if (replacements != null) {
    expect(
      issues.map((issue) => issue.suggestion!.replacement),
      equals(replacements),
      reason: 'incorrect replacement',
    );
  }

  if (replacementComments != null) {
    expect(
      issues.map((issue) => issue.suggestion!.comment),
      equals(replacementComments),
      reason: 'incorrect replacement comment',
    );
  }
}

void verifyNoIssues(Iterable<Issue> issues) {
  expect(issues.isEmpty, isTrue);
}
