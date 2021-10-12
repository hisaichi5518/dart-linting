import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:analyzer/source/line_info.dart';
import 'package:linting/foundation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path/path.dart' as path;
import 'package:source_span/source_span.dart';
import 'package:test/test.dart';

class _TestRule extends Rule {
  @override
  List<Issue> check(InternalResolvedUnitResult source) {
    return [];
  }

  @override
  Uri get documentation => Uri();

  @override
  String get ruleId => 'test-rule';

  @override
  Severity get severity => Severity.error;
}

class _AnnotatedNodeMock extends Mock implements AnnotatedNode {}

class _CompilationUnitMock extends Mock implements CompilationUnit {}

class _LineInfoMock extends Mock implements LineInfo {}

class _TokenMock extends Mock implements Token {}

void main() {
  group('createIssue', () {
    test('success', () async {
      final location = SourceSpan(
        SourceLocation(5, sourceUrl: 'foo.dart'),
        SourceLocation(12, sourceUrl: 'foo.dart'),
        'foo bar',
      );
      final replacement = Replacement(comment: "", replacement: "");
      final issue = _TestRule().createIssue(
        location: location,
        message: 'body is empty',
        verboseMessage: 'verbose message',
        replacement: replacement,
      );
      expect(issue.ruleId, 'test-rule');
      expect(issue.documentation, Uri());
      expect(issue.severity, Severity.error);
      expect(issue.message, 'body is empty');
      expect(issue.location, location);
      expect(issue.verboseMessage, 'verbose message');
      expect(issue.suggestion, replacement);
    });
  });

  // Copied from https://github.com/dart-code-checker/dart-code-metrics/blob/474c2a69f9f356aed8bee5a8cb5ec86feeafcad1/test/utils/node_utils_test.dart#L22
  group('nodeLocation returns information about node original code', () {
    const nodeComment = '/*comment*/';
    const nodeCode = 'code';
    const node = '$nodeComment$nodeCode';
    const preNodeCode = 'prefix ';
    const postNodeCode = ' postfix';

    const line = 2;

    const nodeOffset = preNodeCode.length;
    final nodeOffsetLineInfo = CharacterLocation(line, nodeOffset - line);

    const nodeEnd = nodeOffset + node.length;
    final nodeEndLineInfo = CharacterLocation(line, nodeEnd - line);

    const codeOffset = preNodeCode.length + nodeComment.length;
    final codeOffsetLineInfo = CharacterLocation(line, codeOffset - line);

    const sourcePath = '/source.dart';

    final lineInfoMock = _LineInfoMock();
    when(() => lineInfoMock.getLocation(nodeOffset))
        .thenReturn(nodeOffsetLineInfo);
    when(() => lineInfoMock.getLocation(nodeEnd)).thenReturn(nodeEndLineInfo);
    when(() => lineInfoMock.getLocation(codeOffset))
        .thenReturn(codeOffsetLineInfo);

    final tokenMock = _TokenMock();
    when(() => tokenMock.offset).thenReturn(codeOffset);
    when(() => tokenMock.end).thenReturn(nodeEnd);

    final nodeMock = _AnnotatedNodeMock();
    when(() => nodeMock.firstTokenAfterCommentAndMetadata)
        .thenReturn(tokenMock);
    when(() => nodeMock.offset).thenReturn(nodeOffset);
    when(() => nodeMock.end).thenReturn(nodeEnd);

    final sourceStub = InternalResolvedUnitResult(
      path: sourcePath,
      content: '$preNodeCode$node$postNodeCode',
      unit: _CompilationUnitMock(),
      lineInfo: lineInfoMock,
    );

    test('without comment or metadata', () {
      final span = _TestRule().nodeLocation(node: nodeMock, source: sourceStub);

      expect(span.sourceUrl?.toFilePath(), equals(path.normalize(sourcePath)));

      expect(span.start.offset, equals(codeOffset));
      expect(span.start.line, equals(line));
      expect(span.start.column, equals(codeOffset - line));

      expect(span.end.offset, equals(nodeEnd));
      expect(span.end.line, equals(line));
      expect(span.end.column, equals(nodeEnd - line));

      expect(span.text, equals(nodeCode));
    });
    test('with comment or metadata', () {
      final span = _TestRule().nodeLocation(
        node: nodeMock,
        source: sourceStub,
        withCommentOrMetadata: true,
      );

      expect(
        span.start.sourceUrl?.toFilePath(),
        equals(path.normalize(sourcePath)),
      );
      expect(span.start.offset, equals(nodeOffset));
      expect(span.start.line, equals(line));
      expect(span.start.column, equals(nodeOffset - line));

      expect(
          span.end.sourceUrl?.toFilePath(), equals(path.normalize(sourcePath)));
      expect(span.end.offset, equals(nodeEnd));
      expect(span.end.line, equals(line));
      expect(span.end.column, equals(nodeEnd - line));

      expect(span.text, equals(node));
    });
  });
}
