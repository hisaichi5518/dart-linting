import 'dart:io';

import 'package:linting/foundation.dart';
import 'package:test/test.dart';

void main() {
  group('AnalysisOptions', () {
    group('analyzerExclude', () {
      test('success', () async {
        final options = AnalysisOptions(options: {
          'analyzer': {
            'exclude': ['**.g.dart', '**.freezed.dart']
          },
        });
        expect(options.analyzerExclude, ['**.g.dart', '**.freezed.dart']);
      });

      test('empty', () async {
        final options = AnalysisOptions(options: {
          'analyzer': {'exclude': []},
        });
        expect(options.analyzerExclude, []);
      });

      test('exclude is null', () async {
        final options = AnalysisOptions(options: {
          'analyzer': {},
        });
        expect(options.analyzerExclude, []);
      });

      test('parent is null', () async {
        final options = AnalysisOptions(options: {});
        expect(options.analyzerExclude, []);
      });
    });

    group('lintingRules', () {
      test('success', () async {
        final options = AnalysisOptions(options: {
          'linting': {
            'rules': ['test-rule']
          },
        });
        expect(options.lintingRules(), ['test-rule']);
      });

      test('empty', () async {
        final options = AnalysisOptions(options: {
          'linting': {'rules': []},
        });
        expect(options.lintingRules(), []);
      });

      test('rules is null', () async {
        final options = AnalysisOptions(options: {
          'linting': {},
        });
        expect(options.lintingRules(), []);
      });

      test('parent is null', () async {
        final options = AnalysisOptions(options: {});
        expect(options.lintingRules(), []);
      });

      test('set key', () async {
        final options = AnalysisOptions(options: {
          'key-name': {
            'rules': ['test-rule']
          },
        });
        expect(options.lintingRules(key: 'key-name'), ['test-rule']);
      });
    });
  });

  group('loadFromFile', () {
    test('has yaml', () async {
      final options =
          AnalysisOptionsLoader().loadFromFile(File("analysis_options.yaml"));
      expect(options.options["include"], "package:lints/recommended.yaml");
    });

    test('no yaml', () async {
      final options = AnalysisOptionsLoader()
          .loadFromFile(File("analysis_options_not_found.yaml"));
      expect(options.options["include"], null);
    });

    test('null', () async {
      final options = AnalysisOptionsLoader().loadFromFile(null);
      expect(options.options["include"], null);
    });
  });
}
