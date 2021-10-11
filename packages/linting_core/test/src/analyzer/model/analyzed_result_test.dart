import 'package:linting_core/linting_core.dart';
import 'package:test/test.dart';

void main() {
  test('create instance', () async {
    final result = AnalyzedResult(filePath: '', issues: []);
    expect(result.filePath, '');
    expect(result.issues, []);
  });
}
