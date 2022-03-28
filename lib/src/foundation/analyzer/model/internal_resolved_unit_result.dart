import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/source/line_info.dart';

class InternalResolvedUnitResult {
  final String path;
  final String content;
  final CompilationUnit unit;
  final LineInfo lineInfo;

  const InternalResolvedUnitResult({
    required this.path,
    required this.content,
    required this.unit,
    required this.lineInfo,
  });
}
