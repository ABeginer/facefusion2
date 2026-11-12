#!/bin/bash
set -e
python3 -m venv /workspace/ff_venv
/workspace/ff_venv/bin/pip install --upgrade pip --no-cache-dir
/workspace/ff_venv/bin/pip install -r /workspace/facefusion/requirements.txt onnxruntime-gpu --no-cache-dir
chmod +x /workspace/facefusion/run.sh
/workspace/facefusion/run.sh
