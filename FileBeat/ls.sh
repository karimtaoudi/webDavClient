#! /usr/bin/env sh

PERIOD=${1:-60}
DEST=${WEBDAV_MOUNT:-/usr/share/filebeat/logs}

. trap.sh

while true; do
    ls $DEST
    sleep $PERIOD
done
