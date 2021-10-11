import 'package:linting_core/linting_core.dart';
import 'package:test/test.dart';

void main() {
  group('FileResolver', () {
    test('has file', () async {
      final path = "test/src/analyzer/model/examples/exists.dart";
      final unit = await FileResolver.resolve(path);
      expect(unit.exists, isTrue);
    });

    test('no file', () async {
      final path = "test/src/analyzer/model/examples/not_exists.dart";
      try {
        await FileResolver.resolve(path);
        fail("failed");
      } catch (error) {
        expect(error, isA<ArgumentError>());
      }
    });
  });
}
