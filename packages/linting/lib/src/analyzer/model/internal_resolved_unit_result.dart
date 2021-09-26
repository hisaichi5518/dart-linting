import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/source/line_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'internal_resolved_unit_result.freezed.dart';

@freezed
class InternalResolvedUnitResult with _$InternalResolvedUnitResult {
  const factory InternalResolvedUnitResult({
    required String path,
    required String content,
    required CompilationUnit unit,
    required LineInfo lineInfo,
  }) = _InternalResolvedUnitResult;
}
