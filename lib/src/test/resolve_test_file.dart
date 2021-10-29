import 'package:linting/foundation.dart';

Future<InternalResolvedUnitResult> resolveTestFile(String path) async {
  final unit = await FileResolver.resolve(path);
  return InternalResolvedUnitResult(
    path: unit.path,
    content: unit.content,
    unit: unit.unit,
    lineInfo: unit.lineInfo,
  );
}
