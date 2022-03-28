import 'package:glob/glob.dart';
import 'package:path/path.dart';

import 'rule.dart';

class AnalyzerConfig {
  final Iterable<Rule> rules;
  final Iterable<String> excludes;
  final String rootFolder;

  const AnalyzerConfig({
    required this.rules,
    required this.excludes,
    required this.rootFolder,
  });

  Iterable<Glob> get excludePatterns {
    return excludes.map((exclude) {
      return Glob(normalize(join(rootFolder, exclude)).replaceAll(r'\', '/'));
    });
  }
}
