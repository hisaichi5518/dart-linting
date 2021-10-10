import 'package:args/command_runner.dart';
import 'package:linting_cli/src/commands/models/common_command_options.dart';

import 'invalid_argument_exception.dart';

abstract class BaseCommand extends Command<void> with CommonCommandOptions {
  Future<void> validateCommand();

  Future<void> runCommand();

  @override
  Future<void> run() async {
    try {
      await validateCommand();
    } on InvalidArgumentException catch (e) {
      usageException(e.message);
    } catch (e) {
      usageException(e.toString());
    }
    return runCommand();
  }
}
