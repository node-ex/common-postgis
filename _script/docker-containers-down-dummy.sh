#!/usr/bin/env bash
set -eu
set -E
# set -x
# set -o pipefail

docker-compose \
  --file docker-compose.dummy.yml \
  down \
    --timeout 0
