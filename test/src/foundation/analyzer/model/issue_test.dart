import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:linting/foundation.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  test('create instance', () async {
    final issue = Issue(
      documentation: Uri(),
      location: SourceSpan(
        SourceLocation(5, sourceUrl: 'foo.dart'),
        SourceLocation(12, sourceUrl: 'foo.dart'),
        'foo bar',
      ),
      message: 'body is empty',
      ruleId: 'test-rule',
      severity: Severity.error,
    );

    expect(issue.message, 'body is empty');
    expect(issue.ruleId, 'test-rule');
    expect(issue.severity, Severity.error);
  });
}
