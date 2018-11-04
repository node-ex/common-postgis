#!/usr/bin/env bash
set -eu
set -E
# set -x
# set -o pipefail

# Create .env file.
./_script/env-create-dummy.sh

# Build Docker container.
docker-compose \
  --file docker-compose.dummy.yml \
  build \
    --force-rm \
    --no-cache \
    $(sed 's/^/--build-arg /g' .env | tr '\n' ' ')
