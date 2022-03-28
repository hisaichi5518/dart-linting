# linting

linting is a framework for creating custom linter.

## Motivation

Dart has a [linter](https://github.com/dart-lang/linter), but it is currently not able to create custom rules.

https://github.com/dart-lang/linter/issues/697

There are several ways to create custom rules, but each has its own disadvantages.

- Create your own linter command
  - Easy to implement.
  - Cannot check errors in the IDE.
- Use the analyzer_plugin
  - Errors can be displayed in the IDE.
  - Difficult to implement and debug.
  - To check errors in CI (ex, Github Action), need to create a command.

linting is a framework for solving these problems.

## Get Started

The complete code can be found at [examples](https://github.com/hisaichi5518/dart-linting/tree/main/examples)

## TODO

- [ ] auto-fix command for CLI
- [ ] auto-fix command for analyzer_plugin
- [ ] linting create .
- [ ] documents

## Release

- create and push release branch. (ex, `release/1.2.0`)
- Update CHANGELOG.md
- Update pubspec.yaml
- Create tag
- Create release
- run `dart pub publish`
- merge release branch.
