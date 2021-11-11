# coding: utf-8
import sys
import utils

# python .github/workflows/scripts/override_version.py example/tools/analyzer_plugin/pubspec.yaml 1.1.0
# pubspec_yaml = sys.argv[1]
# version = sys.argv[2]
# utils.override_version(pubspec_yaml, version)


utils.override_changelog('CHANGELOG.md', '1.2.0', '- 変更内容')