import 'dart:io';

import 'package:args/command_runner.dart';

class CliRunner extends CommandRunner<void> {
  CliRunner({
    Iterable<Command<void>> commands = const <Command<void>>[],
  }) : super('linting', 'Analyze your code') {
    if (commands.isEmpty) {
      throw Exception("commands is empty!");
    }
    commands.forEach(addCommand);
  }

  @override
  String get invocation => '${super.invocation} <directories>';

  @override
  Future<void> run(Iterable<String> args) async {
    try {
      await super.run(args);
    } on UsageException catch (e) {
      print('${e.message}\n');
      print('${e.usage}\n');
      exit(64);
    } catch (e, stack) {
      print('linting has exited unexpectedly: "$e" $stack');
      exit(1);
    }
  }
}
