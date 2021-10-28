import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/syntactic_entity.dart';
import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:source_span/source_span.dart';

import 'internal_resolved_unit_result.dart';
import 'issue.dart';
import 'replacement.dart';

abstract class Rule {
  Issue createIssue({
    required SourceSpan location,
    required String message,
    String? verboseMessage,
    Replacement? replacement,
  }) {
    return Issue(
      ruleId: ruleId,
      documentation: documentation,
      location: location,
      severity: severity,
      message: message,
      verboseMessage: verboseMessage,
      suggestion: replacement,
    );
  }

  // Copied from https://github.com/dart-code-checker/dart-code-metrics/blob/474c2a69f9f356aed8bee5a8cb5ec86feeafcad1/lib/src/utils/node_utils.dart#L7
  /// Returns [SourceSpan] with information about original code for [node] from [source]
  SourceSpan nodeLocation({
    required SyntacticEntity node,
    required InternalResolvedUnitResult source,
    bool withCommentOrMetadata = false,
  }) {
    final offset = !withCommentOrMetadata && node is AnnotatedNode
        ? node.firstTokenAfterCommentAndMetadata.offset
        : node.offset;
    final end = node.end;
    final sourceUrl = Uri.file(source.path);

    final offsetLocation = source.lineInfo.getLocation(offset);
    final endLocation = source.lineInfo.getLocation(end);

    return SourceSpan(
      SourceLocation(
        offset,
        sourceUrl: sourceUrl,
        line: offsetLocation.lineNumber,
        column: offsetLocation.columnNumber,
      ),
      SourceLocation(
        end,
        sourceUrl: sourceUrl,
        line: endLocation.lineNumber,
        column: endLocation.columnNumber,
      ),
      source.content.substring(offset, end),
    );
  }

  String get ruleId;

  Uri get documentation;

  Severity get severity;

  Iterable<Issue> check(InternalResolvedUnitResult source);
}
