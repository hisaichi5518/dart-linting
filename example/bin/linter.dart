import 'package:linting/cli.dart';
import 'package:linting_example_plugin_loader/rules.dart';

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
