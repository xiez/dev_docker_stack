#!/bin/bash
set -e

# Script to workaround docker-machine/boot2docker OSX host volume issues: https://github.com/docker-library/mysql/issues/99

echo '* Working around permission errors locally by making sure that "elasticsearch" uses the same uid and gid as the host volume'
TARGET_UID=$(stat -c "%u" /usr/share/elasticsearch/data)
echo '-- Setting ES user to use uid '$TARGET_UID
usermod -o -u $TARGET_UID elasticsearch || true
TARGET_GID=$(stat -c "%g" /usr/share/elasticsearch/data)
echo '-- Setting ES group to use gid '$TARGET_GID
groupmod -o -g $TARGET_GID elasticsearch || true
echo
echo '* Starting Elasticsearch'
chown -R elasticsearch:root /usr/share/elasticsearch/

/docker-entrypoint.sh elasticsearch
