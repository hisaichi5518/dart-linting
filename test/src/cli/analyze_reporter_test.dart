import 'package:linting/cli.dart';
import 'package:test/test.dart';

class TestAnalyzeReporter extends AnalyzeReporter {
  @override
  Future<void> report(Iterable<AnalyzedResult> resultList) async {}

  @override
  String get reporterId => '';
}

void main() {
  group('AnalyzeReporter', () {
    test('create', () async {
      expect(TestAnalyzeReporter(), isA<AnalyzeReporter>());
    });
  });
}
