#!/usr/bin/env bash
set -eu
set -E
# set -x
# set -o pipefail

if [ ! -f '.env' ]; then
  echo '>>> Create .env file from .env.dummy.template .'
  cp -a '.env.dummy.template' '.env'
fi
