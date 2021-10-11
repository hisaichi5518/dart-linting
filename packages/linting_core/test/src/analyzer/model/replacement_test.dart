import 'package:linting_core/linting_core.dart';
import 'package:test/test.dart';

void main() {
  test('create instance', () async {
    final replacement = Replacement(
      comment: 'this is replacement',
      replacement: 'value',
    );
    expect(replacement.comment, 'this is replacement');
    expect(replacement.replacement, 'value');
  });
}
