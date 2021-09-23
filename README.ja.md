# dart-linting

lintingはanalyzer_pluginを利用してcustom linterを作成するためのフレームワークです。

## Motivation

Dartには[linter](https://github.com/dart-lang/linter)がありますが、現状Custom Ruleを利用することが出来ません。

https://github.com/dart-lang/linter/issues/697

Custom Ruleを利用するには、以下の方法がありますがそれぞれデメリットもあります。

- 独自のlinterコマンドを作成する
  - 実装が容易です
  - IDE上でエラーを確認できません
- analyzer_plugin を利用する
  - IDE上でエラーを表示できます
  - 実装が難しいです

lintingは、analyzer_pluginを利用してcustom linterを作成する時の実装を楽にするためのフレームワークです。