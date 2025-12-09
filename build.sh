#!/usr/bin/env bash

set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${SCRIPT_DIR}

rm -rf build/ dist/ *.spec

poetry run pyinstaller \
    src/main.py \
    --name main \
    --onefile \
    --clean \
    --noconfirm
