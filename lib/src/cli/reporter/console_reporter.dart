import 'dart:io';

import '../../../foundation.dart';
import '../analyze_reporter.dart';

class ConsoleReporter extends AnalyzeReporter {
  final void Function(Object? object) printer;

  const ConsoleReporter(this.printer);

  @override
  String get reporterId => 'console';

  @override
  Future<void> report(Iterable<AnalyzedResult> resultList) async {
    for (final result in resultList) {
      for (final issue in result.issues) {
        final source =
            (issue.location.start.sourceUrl?.path ?? 'unknown source')
                .replaceFirst(Directory.current.path + "/", "");
        final line = issue.location.start.line;
        final column = issue.location.start.column;

        printer(
          '${issue.severity} • ${issue.message} • $source:$line:$column • ${issue.ruleId}',
        );
      }
    }
  }
}
