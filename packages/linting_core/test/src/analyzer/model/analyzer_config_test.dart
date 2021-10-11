import 'dart:io';

import 'package:linting_core/linting_core.dart';
import 'package:test/test.dart';

void main() {
  test('create instance', () async {
    final config = AnalyzerConfig(
      rules: [],
      excludes: [],
      rootFolder: Directory.current.path,
    );

    expect(config.rules, []);
    expect(config.excludes, []);
    expect(config.rootFolder, Directory.current.path);
  });

  group('excludePatterns', () {
    test('empty', () async {
      final config = AnalyzerConfig(
        rules: [],
        excludes: [],
        rootFolder: Directory.current.path,
      );

      expect(config.excludePatterns, []);
    });

    test('not empty', () async {
      final config = AnalyzerConfig(
        rules: [],
        excludes: ['**/test.dart'],
        rootFolder: Directory.current.path,
      );

      expect(config.excludePatterns.map((e) => e.pattern), [
        '${Directory.current.path}/**/test.dart',
      ]);
    });

    test('normalize', () async {
      final config = AnalyzerConfig(
        rules: [],
        excludes: ['**//test.dart'],
        rootFolder: Directory.current.path,
      );

      expect(config.excludePatterns.map((e) => e.pattern), [
        '${Directory.current.path}/**/test.dart',
      ]);
    });
  });
}
