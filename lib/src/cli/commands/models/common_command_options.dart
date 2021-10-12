import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:path/path.dart';

import 'invalid_argument_exception.dart';

mixin CommonCommandOptions on Command<void> {
  static final String rootFolder = 'root-folder';
  static final String exclude = 'exclude';

  void validateRootFolderOption() {
    final rootFolderPath = argResults?[rootFolder] as String;
    if (Directory(rootFolderPath).existsSync()) {
      return;
    }
    final _exceptionMessage =
        'Root folder $rootFolderPath does not exist or not a directory.';

    throw InvalidArgumentException(_exceptionMessage);
  }

  void validateTargetDirectories() {
    final rest = argResults?.rest ?? [];
    if (rest.isEmpty) {
      const _exceptionMessage =
          'Invalid number of directories. At least one must be specified.';

      throw const InvalidArgumentException(_exceptionMessage);
    }

    final rootFolderPath = argResults?[rootFolder] as String;
    for (final relativePath in rest) {
      final absolutePath = join(rootFolderPath, relativePath);
      if (!Directory(absolutePath).existsSync()) {
        final _exceptionMessage =
            "$absolutePath doesn't exist or isn't a directory.";

        throw InvalidArgumentException(_exceptionMessage);
      }
    }
  }

  void usesRootFolderOption() {
    argParser
      ..addSeparator('')
      ..addOption(
        rootFolder,
        help: 'Root folder.',
        valueHelp: './',
        defaultsTo: Directory.current.path,
      );
  }

  void usesExcludeOption() {
    argParser.addOption(
      exclude,
      help: 'File paths in Glob syntax to be exclude.',
      valueHelp: '{**.g.dart,**.template.dart,**.freezed.dart}',
      defaultsTo: '{**.g.dart,**.template.dart.**.freezed.dart}',
    );
  }
}
