#!/usr/bin/env bash
set -eu
# set -E
# set -x
set -o pipefail

ls -la /var/lib/postgresql/data

if [ "$*" = 'postgres' ]; then
    docker-entrypoint.sh postgres -c 'config_file=/etc/postgresql/postgresql.conf'
    # update-postgis.sh
else
    exec "$@"
fi
