// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:linting/linting.dart';

void main() {
  group('Linting', () {
    test('can be instantiated', () {
      expect(Linting(), isNotNull);
    });
  });
}
