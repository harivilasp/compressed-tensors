#!/usr/bin/env bash

cat /etc/issue

# install uv and check env
apk add --no-cache curl
curl -LsSf https://astral.sh/uv/install.sh | sh
export LD_LIBRARY_PATH=/usr/local/nvidia/lib64
export PATH="$HOME/.local/bin:/usr/local/nvidia/bin:$PATH"
nvidia-smi
uv --version
