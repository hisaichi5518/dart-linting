import '../../foundation.dart';

abstract class AnalyzeReporter {
  const AnalyzeReporter();

  String get reporterId;

  Future<void> report(List<AnalyzedResult> resultList);
}
