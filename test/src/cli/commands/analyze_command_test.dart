import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:args/command_runner.dart';
import 'package:linting/cli.dart';
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
  group("throws exceptions", () {
    test('no reporters', () async {
      expect(
        () => AnalyzeCommand(
          analyzer: LintingAnalyzer(),
          reporters: [],
          rules: [],
        ),
        throwsException,
      );
    });

    test('no rules', () async {
      expect(
        () => AnalyzeCommand(
          analyzer: LintingAnalyzer(),
          reporters: [
            ConsoleReporter((object) {
              // TODO
            })
          ],
          rules: [],
        ),
        throwsException,
      );
    });
  });

  group("invocation", () {
    test('has error', () async {
      final command = AnalyzeCommand(
        analyzer: LintingAnalyzer(),
        reporters: [ConsoleReporter((object) {})],
        rules: [_TestRule()],
      );
      final runner = CommandRunner('test', 'A test command runner.');
      runner.addCommand(command);
      expect(
        runner.invocation,
        'test <command> [arguments]',
      );
    });
  });

  group('run', () {
    test('cant find options', () async {
      final command = AnalyzeCommand(
        analyzer: LintingAnalyzer(),
        reporters: [ConsoleReporter((object) {})],
        rules: [_TestRule()],
      );
      final runner = CommandRunner('test', 'A test command runner.');
      runner.addCommand(command);
      expect(
        runner.run([
          'analyze',
          'examples',
        ]).catchError((error) {
          expect(error, isA<UsageException>());
        }),
        completes,
      );
    });

    test('invalid options', () async {
      final command = AnalyzeCommand(
        analyzer: LintingAnalyzer(),
        reporters: [ConsoleReporter((object) {})],
        rules: [_TestRule()],
      );
      final runner = CommandRunner('test', 'A test command runner.');
      runner.addCommand(command);
      expect(
        runner.run([
          'analyze',
          '.',
          '--root-folder=test/src/cli/commands/examples',
        ]).catchError((error) {
          expect(error, isA<UsageException>());
        }),
        completes,
      );
    });

    test('root-folder', () async {
      final command = AnalyzeCommand(
        analyzer: LintingAnalyzer(),
        reporters: [ConsoleReporter((object) {})],
        rules: [_TestRule()],
      );
      final runner = CommandRunner('test', 'A test command runner.');
      runner.addCommand(command);
      expect(
        runner.run([
          'analyze',
          'examples',
          '--root-folder=test/src/cli/commands/',
        ]).catchError((error) {
          expect(error, isA<ExitCommandException>());
        }),
        completes,
      );
    });

    test('reporter', () async {
      final command = AnalyzeCommand(
        analyzer: LintingAnalyzer(),
        reporters: [ConsoleReporter((object) {})],
        rules: [_TestRule()],
      );
      final runner = CommandRunner('test', 'A test command runner.');
      runner.addCommand(command);
      expect(
        runner.run([
          'analyze',
          'examples',
          '--root-folder=test/src/cli/commands/',
          '--reporter=console'
        ]).catchError((error) {
          expect(error, isA<ExitCommandException>());
        }),
        completes,
      );
    });
  });
}
