# coding: utf-8
import sys
import utils

# python .github/workflows/scripts/get_next_version.py release/1.1.0
version = sys.argv[1] if len(sys.argv) > 1 else 'release/1.0.0'
version = version.replace('release/', '')
print(utils.get_next_version(version))