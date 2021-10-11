import 'package:analyzer/source/line_info.dart';
import 'package:linting_core/linting_core.dart';
import 'package:test/test.dart';

void main() {
  group('isSuppressed', () {
    test('ignore for file', () async {
      final suppression = Suppression(
        '// ignore_for_file: test-rule',
        LineInfo([0]),
      );
      expect(suppression.isSuppressed('test-rule'), isTrue);
    });

    test('has space', () async {
      final suppression = Suppression(
        '//  ignore_for_file: test-rule  ',
        LineInfo([0]),
      );
      expect(suppression.isSuppressed('test-rule'), isTrue);
    });

    test('has space, but not ignore', () async {
      final suppression = Suppression(
        '//  ignore_for_file  : test-rule  ',
        LineInfo([0]),
      );
      expect(suppression.isSuppressed('test-rule'), isFalse);
    });

    test('not ignore for file', () async {
      final suppression = Suppression(
        'final test = "value";',
        LineInfo([0]),
      );
      expect(suppression.isSuppressed('test-rule'), isFalse);
    });
  });

  group('isSuppressedAt', () {
    test('ignore for line', () async {
      final path = "test/src/analyzer/model/examples/ignore_for_line.dart";
      final unit = await FileResolver.resolve(path);

      final suppression = Suppression(unit.content, unit.lineInfo);

      final tests = [
        {'lineIndex': 1, 'expected': false},
        {'lineIndex': 2, 'expected': true},
        {'lineIndex': 3, 'expected': false},
        {'lineIndex': 4, 'expected': true},
        {'lineIndex': 5, 'expected': false},
        {'lineIndex': 6, 'expected': false},
        {'lineIndex': 7, 'expected': true},
        {'lineIndex': 8, 'expected': false},
      ];
      for (final testcase in tests) {
        expect(
          suppression.isSuppressedAt('test-rule', testcase['lineIndex'] as int),
          testcase['expected'],
          reason:
              'line index (${testcase['lineIndex']}) is not ${testcase['expected']}',
        );
      }
    });
  });
}
