import 'issue.dart';

class AnalyzedResult {
  final String filePath;
  final Iterable<Issue> issues;

  const AnalyzedResult({
    required this.filePath,
    required this.issues,
  });
}
