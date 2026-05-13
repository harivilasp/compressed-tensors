#!/usr/bin/env bash

cat /etc/issue

# install uv/compilers and check env
apk add --no-cache curl build-base
curl -LsSf https://astral.sh/uv/install.sh | sh
export LD_LIBRARY_PATH=/usr/local/nvidia/lib64
export PATH="$HOME/.local/bin:/usr/local/nvidia/bin:$PATH"
nvidia-smi
uv --version

# install code and run tests
uv venv testvenv --python 3.10
source testvenv/bin/activate

uv pip install .[dev] --extra-index-url https://download.pytorch.org/whl/cu129
make test
