import 'dart:io';

import 'package:args/command_runner.dart';

import 'commands/analyze_command.dart';

class CliRunner extends CommandRunner<void> {
  static final _commands = [
    AnalyzeCommand(), // TODO: analyzer's reporter
  ];

  CliRunner({
    List<Command<void>> commands = const <Command<void>>[],
  }) : super('linting', 'Analyze your code') {
    if (commands.isEmpty) {
      _commands.forEach(addCommand);
    } else {
      commands.forEach(addCommand);
    }
  }

  @override
  String get invocation => '${super.invocation} <directories>';

  @override
  Future<void> run(Iterable<String> args) async {
    try {
      await super.run(_addDefaultCommand(args));
    } on UsageException catch (e) {
      print('${e.message}\n');
      print('${e.usage}\n');
      exit(64);
    } catch (e, stack) {
      print('linting has exited unexpectedly: "$e" $stack');
      exit(1);
    }
  }

  Iterable<String> _addDefaultCommand(Iterable<String> args) => args.isEmpty
      ? args
      : !commands.keys.contains(args.first)
          ? ['analyze', ...args]
          : args;
}
