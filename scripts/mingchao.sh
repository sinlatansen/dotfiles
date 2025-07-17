#!/bin/bash

# -q 签到
if [[ "$1" == "-q" ]]; then
    cd /home/lzy/workspace/py/Kuro-autosignin
    uv run main.py
fi

cd /mnt/win11-files/workspace/py/mingchao
uv run main.py