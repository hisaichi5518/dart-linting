import 'package:linting/linting.dart';
import 'package:test/test.dart';

void main() {
  group('FileResolver', () {
    test('has file', () async {
      final path = "test/src/test/examples/test.dart";
      final unit = await FileResolver.resolve(path);
      expect(unit.exists, isTrue);
    });

    test('no file', () async {
      final path = "test/src/test/examples/test_not_found.dart";
      try {
        await FileResolver.resolve(path);
        fail("failed");
      } catch (error) {
        expect(error, isA<ArgumentError>());
      }
    });
  });
}
