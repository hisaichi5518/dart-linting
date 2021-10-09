import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:path/path.dart';

class FileResolver {
  static Future<ResolvedUnitResult> resolve(
    String filePath,
  ) async {
    final file = File(filePath);

    if (!file.existsSync()) {
      throw ArgumentError(
        'Unable to find a file for the given path: $filePath',
      );
    }

    final path = normalize(file.absolute.path);

    final parseResult = await resolveFile2(path: path);
    if (parseResult is! ResolvedUnitResult) {
      throw ArgumentError(
        'Unable to correctly resolve file for given path: $path',
      );
    }
    return parseResult;
  }
}
