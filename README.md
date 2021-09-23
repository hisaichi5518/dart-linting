# dart-linting

linting is a framework for creating custom linters using the analyzer_plugin.

## Motivation

Dart has a [linter](https://github.com/dart-lang/linter), but it is currently not able to use Custom Rules.

https://github.com/dart-lang/linter/issues/697

There are several ways to use Custom Rules, but each has its own disadvantages.

- Create your own linter command
  - Easy to implement
  - Cannot check errors in the IDE
- Use the analyzer_plugin
  - Errors can be displayed in the IDE
  - Difficult to implement

linting is a framework to ease the implementation when creating a custom linter using analyzer_plugin.