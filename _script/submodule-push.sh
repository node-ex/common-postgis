#!/usr/bin/env bash
set -eu
set -E
# set -x
# set -o pipefail

./_script/submodule-commit.sh

git pull
git push
