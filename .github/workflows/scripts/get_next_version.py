# coding: utf-8
import sys
import utils

# python .github/workflows/scripts/get_next_version.py 1.1.0
version = sys.argv[1] if len(sys.argv) > 1 else '1.0.0'
print(utils.get_next_version(version))