import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:linting/foundation.dart';
import 'package:linting/src/test/verify.dart';
import 'package:test/test.dart';

class TestRule extends Rule {
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
  test('verifyInitialization', () async {
    final unit =
        await FileResolver.resolve('test/src/test/examples/error.dart');
    final issues = TestRule().check(InternalResolvedUnitResult(
      path: unit.path,
      content: unit.content,
      unit: unit.unit,
      lineInfo: unit.lineInfo,
    ));

    verifyInitialization(
      issues: issues,
      ruleId: 'test-rule',
      severity: Severity.error,
    );
  });

  test('verifyIssues', () async {
    final unit =
        await FileResolver.resolve('test/src/test/examples/error.dart');
    final issues = TestRule().check(InternalResolvedUnitResult(
      path: unit.path,
      content: unit.content,
      unit: unit.unit,
      lineInfo: unit.lineInfo,
    ));

    verifyIssues(
      issues: issues,
      startOffsets: [12],
      startColumns: [13],
      startLines: [1],
      endOffsets: [14],
      locationTexts: ['{}'],
      messages: ['block is empty'],
    );
  });

  test('verifyNoIssues', () async {
    verifyNoIssues([]);
  });
}
