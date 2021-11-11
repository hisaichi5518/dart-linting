# coding: utf-8
import sys
import utils

next_version = sys.argv[1]
changelog = sys.argv[2]
utils.override_changelog('CHANGELOG.md', next_version, changelog)