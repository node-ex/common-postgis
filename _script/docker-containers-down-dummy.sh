#!/usr/bin/env bash
set -eu
set -E
# set -x
# set -o pipefail

# Load environment variables from .env .
$(sed 's/^/export /g' .env)

echo ">>> Container down: ${DOCKER_REPOSITORY_USERNAME}-${DOCKER_REPOSITORY_NAME}-dummy ."
docker-compose \
  --file docker-compose.dummy.yml \
  down \
    --timeout 0 || true

echo '>>> Remove Docker volumes, if there are any.'
docker volume rm $(docker volume ls --quiet | grep --regexp "${DOCKER_REPOSITORY_USERNAME}-${DOCKER_REPOSITORY_NAME}-dummy-.*") 2> /dev/null
