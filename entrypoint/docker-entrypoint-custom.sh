#!/usr/bin/env bash
set -eu
# set -E
# set -x
set -o pipefail

if [ "$*" = 'postgres' ]; then
    docker-entrypoint-parallel.sh &

    echo '>>> Start PostgreSQL.'
    docker-entrypoint.sh postgres -c 'config_file=/etc/postgresql/postgresql.conf'
    echo '>>> Done.'
else
    exec "$@"
fi
