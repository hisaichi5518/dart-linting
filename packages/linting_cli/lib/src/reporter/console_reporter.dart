import 'package:linting/linting.dart';
import 'package:linting_cli/src/reporter/analyze_reporter.dart';
import 'package:path/path.dart';

class ConsoleReporter extends AnalyzeReporter {
  final void Function(Object? object) printer;

  const ConsoleReporter(this.printer);

  @override
  String get reporterId => 'console';

  @override
  Future<void> report(List<AnalyzedResult> resultList) async {
    for (final result in resultList) {
      for (final issue in result.issues) {
        final source = issue.location.start.sourceUrl?.path ?? 'unknown source';
        final line = issue.location.start.line;
        final column = issue.location.start.column;
        printer(
          '${issue.severity} • ${issue.message} • ${basename(source)}:$line:$column • ${issue.ruleId}',
        );
      }
    }
  }
}
