import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:linting/linting.dart';
import 'package:linting_cli/linting_cli.dart';

// dart example.dart analyze lib
Future<void> main(List<String> args) async {
  await CliRunner(commands: [
    AnalyzeCommand(
      rules: [_TestRule()],
      reporters: [ConsoleReporter(print)],
      analyzer: LintingAnalyzer(),
    ),
  ]).run(args);
}

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
