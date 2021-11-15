import 'package:args/command_runner.dart';
import 'package:linting/cli.dart';
import 'package:test/test.dart';

class _CommandRequest {}

class _TestCommand extends BaseCommand<_CommandRequest> {
  final List<_CommandRequest> requests = [];

  @override
  String get description => 'test';

  @override
  String get name => 'test';

  @override
  Future<void> runCommand(_CommandRequest request) async {
    requests.add(request);
  }

  @override
  Future<_CommandRequest> validateCommand() async {
    return _CommandRequest();
  }
}

class _UsageCommand extends BaseCommand<_CommandRequest> {
  final List<_CommandRequest> requests = [];

  @override
  String get description => 'test';

  @override
  String get name => 'test';

  @override
  Future<void> runCommand(_CommandRequest request) async {
    requests.add(request);
  }

  @override
  Future<_CommandRequest> validateCommand() async {
    throw UsageException("test", usage);
  }
}

void main() {
  group('run', () {
    test('no commands', () async {
      expect(() => CliRunner(commands: []), throwsException);
    });

    test('has commands', () async {
      final command = _TestCommand();
      final runner = CliRunner(commands: [command]);
      await runner.run(["test"]);

      expect(command.requests.length, 1);
    });
  });
}
