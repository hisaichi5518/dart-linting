import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:linting/linting.dart';
import 'package:linting/src/analyzer/linting_analyzer.dart';
import 'package:linting/src/analyzer/model/analyzer_config.dart';
import 'package:linting/src/analyzer/model/internal_resolved_unit_result.dart';
import 'package:linting/src/analyzer/model/issue.dart';
import 'package:linting/src/analyzer/model/rule.dart';
import 'package:path/path.dart';
import 'package:test/test.dart';

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
      final path = "test/src/analyzer/examples/test.dart";
      final unit = await FileResolver.resolve(path);
      final analyzer = LintingAnalyzer();
      final result = await analyzer.analyze(
        AnalyzerConfig(rules: [_TestRule()]),
        unit,
        rootFolder: dirname(path),
        filePath: unit.path,
      );
      expect(result.issues.length, 1);
    });
  });
}
