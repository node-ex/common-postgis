#!/usr/bin/env bash
set -eu
set -E
# set -x
# set -o pipefail

# Create .env file, if it does not exist.
./_script/env-create-dummy.sh

# Load environment variables from .env .
$(sed 's/^/export /g' .env)

# Build image, if it does not exist.
if [ "`docker image inspect ${DOCKER_REPOSITORY_USERNAME}/${DOCKER_REPOSITORY_NAME}-dummy:latest 2> /dev/null || true`" = '[]' ]; then
  ./_script/docker-images-build-dummy.sh
fi

echo ">>> Container up: ${DOCKER_REPOSITORY_USERNAME}-${DOCKER_REPOSITORY_NAME}-dummy ."
docker-compose \
  --file docker-compose.dummy.yml \
  up \
    --no-build \
    --force-recreate \
    --detach
