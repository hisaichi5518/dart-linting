// Copied from https://github.com/dart-code-checker/dart-code-metrics/blob/21d07859a21718e116bf8b65ce07d2ac8c74be5c/lib/src/analyzers/lint_analyzer/models/suppression.dart
// refs https://github.com/dart-lang/sdk/blob/50fb0c6e6150d76409819a9eca24cc77f0cda269/pkg/analyzer/lib/src/ignore_comments/ignore_info.dart
import 'package:analyzer/source/line_info.dart';

/// Represents an information about rule suppression.
class Suppression {
  static final _ignoreMatchers = RegExp('//[ ]*ignore:(.*)', multiLine: true);

  static final _ignoreForFileMatcher =
      RegExp('//[ ]*ignore_for_file:(.*)', multiLine: true);

  final _ignoreMap = <int, List<String>>{};
  final _ignoreForFileSet = <String>{};

  /// Checks that the [id] is globally suppressed.
  bool isSuppressed(String id) => _ignoreForFileSet.contains(_canonicalize(id));

  /// Checks that the [id] is suppressed for the [lineIndex].
  bool isSuppressedAt(String id, int? lineIndex) {
    return isSuppressed(id) ||
        (_ignoreMap[lineIndex]?.contains(_canonicalize(id)) ?? false);
  }

  /// Initialize a newly created [Suppression] with the given [content] and [info].
  Suppression(String content, LineInfo info) {
    for (final match in _ignoreMatchers.allMatches(content)) {
      final ids = match.group(1)!.split(',').map(_canonicalize);
      final location = info.getLocation(match.start);
      final lineNumber = location.lineNumber;
      final beforeMatch = content.substring(
        info.getOffsetOfLine(lineNumber - 1),
        info.getOffsetOfLine(lineNumber - 1) + location.columnNumber - 1,
      );

      // If comment sits next to code, so it refers to its own line, otherwise it refers to the next line.
      final ignoredNextLine = beforeMatch.trim().isEmpty;
      _ignoreMap
          .putIfAbsent(
            ignoredNextLine ? lineNumber + 1 : lineNumber,
            () => <String>[],
          )
          .addAll(ids);
    }

    for (final match in _ignoreForFileMatcher.allMatches(content)) {
      _ignoreForFileSet.addAll(match.group(1)!.split(',').map(_canonicalize));
    }
  }

  String _canonicalize(String ruleId) => ruleId.trim().toLowerCase();
}
