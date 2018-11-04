#!/usr/bin/env bash
set -Eeu
# set -x

docker-compose \
  --file docker-compose.dummy.yml \
  up \
    --no-build \
    --force-recreate \
    --detach
