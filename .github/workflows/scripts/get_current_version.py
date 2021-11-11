# coding: utf-8
import sys
import utils

# python .github/workflows/scripts/get_current_version.py tools/analyzer_plugin/pubspec.yaml
pubspec_yaml = sys.argv[1] if len(sys.argv) > 1 else 'pubspec.yaml'
version = utils.get_version_from_pubspec(pubspec_yaml)
print(version)