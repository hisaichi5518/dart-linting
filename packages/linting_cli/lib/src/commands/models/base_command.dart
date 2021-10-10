import 'package:args/command_runner.dart';
import 'package:linting_cli/src/commands/models/common_command_options.dart';

import 'invalid_argument_exception.dart';

abstract class BaseCommand<Request> extends Command<void>
    with CommonCommandOptions {
  Future<Request> validateCommand();

  Future<void> runCommand(Request request);

  @override
  Future<void> run() async {
    try {
      final request = await validateCommand();
      return runCommand(request);
    } on InvalidArgumentException catch (e) {
      usageException(e.message);
    } catch (e) {
      usageException(e.toString());
    }
  }
}
