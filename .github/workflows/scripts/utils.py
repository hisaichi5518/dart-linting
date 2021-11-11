# coding: utf-8
import re

def get_version_from_pubspec(pubspec_yaml):
    with open(pubspec_yaml, 'r') as f:
        repatter = re.compile('^version: ([0-9.]+)')
        for row in f:
            result = repatter.search(row)
            if result:
                return result.group(1)

def override_version(pubspec_yaml, version):
    with open(pubspec_yaml, 'r') as f:
        text = re.sub(r'refs/tags/[0-9.]+', 'refs/tags/%s' % version, f.read())
        text = re.sub(r'version: [0-9.]+', 'version: %s' % version, text)
    with open(pubspec_yaml, 'w') as f:
        f.write(text)

    return version

def override_changelog(changelog_path, next_version, changelog):
    with open(changelog_path, 'r') as f:
        text = f.read()
        text = '## %s\n\n%s\n\n%s' % (next_version, changelog, text)
    with open(changelog_path, 'w') as f:
        f.write(text)