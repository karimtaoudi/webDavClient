#! /usr/bin/env sh

DEST=${WEBDAV_MOUNT:-/usr/share/filebeat/logs}
. trap.sh

tail -f /dev/null