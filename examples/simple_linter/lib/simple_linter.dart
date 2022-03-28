import 'package:linting/cli.dart';
import 'package:simple_linter/rules.dart';

Future<void> runCli(List<String> args) async {
  await CliRunner(commands: [
    AnalyzeCommand(
      rules: rules,
      reporters: [ConsoleReporter(print)],
      analyzer: LintingAnalyzer(),
    ),
  ]).run(args);
}
