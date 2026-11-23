#!/bin/sh
set -e
PORT="${PORT:-8080}"
if [ -z "$UUID" ]; then echo "UUID env var is required" >&2; exit 1; fi
sed -e "s/__PORT__/$PORT/g" -e "s/__UUID__/$UUID/g" /etc/xray/config.template.json > /etc/xray/config.json
exec /usr/bin/xray run -config /etc/xray/config.json
