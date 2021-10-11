import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart';

import 'rule.dart';

part 'analyzer_config.freezed.dart';

@freezed
class AnalyzerConfig with _$AnalyzerConfig {
  const AnalyzerConfig._();

  const factory AnalyzerConfig({
    required Iterable<Rule> rules,
    required Iterable<String> excludes,
    required String rootFolder,
  }) = _AnalyzerConfig;

  Iterable<Glob> get excludePatterns {
    return excludes.map((exclude) {
      return Glob(normalize(join(rootFolder, exclude)).replaceAll(r'\', '/'));
    });
  }
}
