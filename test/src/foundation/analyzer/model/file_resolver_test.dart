import 'package:linting/foundation.dart';
import 'package:test/test.dart';

import '_utils.dart';

void main() {
  group('FileResolver', () {
    test('has file', () async {
      final path = testFilePath("exists.dart");
      final unit = await FileResolver.resolve(path);
      expect(unit.exists, isTrue);
    });

    test('no file', () async {
      final path = testFilePath("not_exists.dart");
      try {
        await FileResolver.resolve(path);
        fail("failed");
      } catch (error) {
        expect(error, isA<ArgumentError>());
      }
    });
  });
}
