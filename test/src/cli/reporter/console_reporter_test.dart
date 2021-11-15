import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:linting/cli.dart';
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

void main() {
  group('report', () {
    test('no issues', () async {
      final messages = <Object?>[];
      final reporter = ConsoleReporter(messages.add);
      reporter.report([
        AnalyzedResult(filePath: "", issues: []),
      ]);

      expect(messages, []);
    });

    test('has issues', () async {
      final messages = <Object?>[];
      final reporter = ConsoleReporter(messages.add);
      reporter.report([
        AnalyzedResult(filePath: "foo.dart", issues: [
          Issue(
            ruleId: "test-rule",
            documentation: Uri(),
            location: SourceSpan(
              SourceLocation(5, sourceUrl: 'foo.dart'),
              SourceLocation(12, sourceUrl: 'foo.dart'),
              'foo bar',
            ),
            severity: Severity.error,
            message: "test rule",
          ),
        ]),
      ]);

      expect(messages, [
        'Severity.error • test rule • foo.dart:0:5 • test-rule',
      ]);
    });
  });
}
