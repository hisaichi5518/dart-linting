import 'dart:io';

import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:linting/linting.dart';
import 'package:test/test.dart';

import '_utils.dart';

class _TestRule extends Rule {
  @override
  List<Issue> check(InternalResolvedUnitResult source) {
    final _visitor = _Visitor();

    source.unit.visitChildren(_visitor);

    return _visitor.emptyBlocks
        .map((block) => createIssue(
              location: nodeLocation(
                node: block,
                source: source,
                withCommentOrMetadata: true,
              ),
              message: 'block is empty',
            ))
        .toList(growable: false);
  }

  @override
  Uri get documentation => Uri();

  @override
  String get ruleId => 'test-rule';

  @override
  Severity get severity => Severity.error;
}

class _Visitor extends RecursiveAstVisitor<void> {
  final _emptyBlocks = <Block>[];

  Iterable<Block> get emptyBlocks => _emptyBlocks;

  @override
  void visitBlock(Block node) {
    super.visitBlock(node);

    if (node.statements.isEmpty && node.parent is! CatchClause) {
      _emptyBlocks.add(node);
    }
  }
}

void main() {
  group('analyze', () {
    test('run', () async {
      final path = testFilePath("error.dart");
      final unit = await FileResolver.resolve(path);
      final analyzer = LintingAnalyzer();
      final result = await analyzer.analyze(
        AnalyzerConfig(
          rules: [_TestRule()],
          excludes: [],
          rootFolder: Directory.current.path,
        ),
        unit,
        filePath: unit.path,
      );
      expect(result.issues.length, 1);
    });

    test('filePath is null', () async {
      final path = testFilePath("not_dart_file.rb");
      final unit = await FileResolver.resolve(path);
      final analyzer = LintingAnalyzer();
      final result = await analyzer.analyze(
        AnalyzerConfig(
          rules: [_TestRule()],
          excludes: [],
          rootFolder: Directory.current.path,
        ),
        unit,
        filePath: null,
      );
      expect(result.issues.length, 0);
    });

    test('not dart file', () async {
      final path = testFilePath("not_dart_file.rb");
      final unit = await FileResolver.resolve(path);
      final analyzer = LintingAnalyzer();
      final result = await analyzer.analyze(
        AnalyzerConfig(
          rules: [_TestRule()],
          excludes: [],
          rootFolder: Directory.current.path,
        ),
        unit,
        filePath: unit.path,
      );
      expect(result.issues.length, 0);
    });

    test('excludes', () async {
      final path = testFilePath("error.dart");
      final unit = await FileResolver.resolve(path);
      final analyzer = LintingAnalyzer();
      final result = await analyzer.analyze(
        AnalyzerConfig(
          rules: [_TestRule()],
          excludes: ['**/error.dart'],
          rootFolder: Directory.current.path,
        ),
        unit,
        filePath: unit.path,
      );
      expect(result.issues.length, 0);
    });

    test('ignore for line', () async {
      final path = testFilePath("ignore_for_line.dart");
      final unit = await FileResolver.resolve(path);
      final analyzer = LintingAnalyzer();
      final result = await analyzer.analyze(
        AnalyzerConfig(
          rules: [_TestRule()],
          excludes: [],
          rootFolder: Directory.current.path,
        ),
        unit,
        filePath: unit.path,
      );
      expect(result.issues.length, 0);
    });

    test('ignore for file', () async {
      final path = testFilePath("ignore_for_file.dart");
      final unit = await FileResolver.resolve(path);
      final analyzer = LintingAnalyzer();
      final result = await analyzer.analyze(
        AnalyzerConfig(
          rules: [_TestRule()],
          excludes: [],
          rootFolder: Directory.current.path,
        ),
        unit,
        filePath: unit.path,
      );
      expect(result.issues.length, 0);
    });
  });
}
