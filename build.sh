#!/usr/bin/env bash

set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
DIST_DIR=${SCRIPT_DIR}/dist

cd ${SCRIPT_DIR}

poetry run pyinstaller \
    src/main.py \
    --name main \
    --onefile \
    --clean \
    --noconfirm
