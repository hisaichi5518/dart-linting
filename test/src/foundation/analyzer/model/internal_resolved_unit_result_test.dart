import 'package:linting/linting.dart';
import 'package:test/test.dart';

import '_utils.dart';

void main() {
  test('create instance', () async {
    final path = testFilePath("exists.dart");
    final unit = await FileResolver.resolve(path);
    final result = InternalResolvedUnitResult(
      content: unit.content,
      lineInfo: unit.lineInfo,
      path: unit.path,
      unit: unit.unit,
    );

    expect(result.content, unit.content);
    expect(result.lineInfo, unit.lineInfo);
    expect(result.path, unit.path);
    expect(result.unit, unit.unit);
  });
}
