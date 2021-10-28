import 'package:linting/cli.dart';

// ignore: avoid_relative_lib_imports
import '../tools/analyzer_plugin/lib/rules.dart';

// dart bin/linter.dart analyze lib
Future<void> main(List<String> args) async {
  await CliRunner(commands: [
    AnalyzeCommand(
      rules: rules,
      reporters: [ConsoleReporter(print)],
      analyzer: LintingAnalyzer(),
    ),
  ]).run(args);
}
