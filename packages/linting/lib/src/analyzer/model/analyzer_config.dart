import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:linting/src/analyzer/model/rule.dart';

part 'analyzer_config.freezed.dart';

@freezed
class AnalyzerConfig with _$AnalyzerConfig {
  const factory AnalyzerConfig({required List<Rule> rules}) = _AnalyzerConfig;
}
