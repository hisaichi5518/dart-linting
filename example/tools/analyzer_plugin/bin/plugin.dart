import 'dart:isolate';

import 'package:analyzer_plugin/starter.dart';
import 'package:linting/analyzer_plugin.dart';

// ignore: avoid_relative_lib_imports
import '../lib/rules.dart';

void main(List<String> args, SendPort sendPort) {
  ServerPluginStarter(LintingAnalyzerPlugin(
    rules: rules,
    analyzeCommand: AnalyzeCommand(const LintingAnalyzer()),
  )).start(sendPort);
}
