#!/bin/bash
set -e
python3 -m venv /workspace/ff_venv
/workspace/ff_venv/bin/pip install --upgrade pip --no-cache-dir
/workspace/ff_venv/bin/pip install -r /workspace/facefusion/requirements.txt --no-cache-dir
/workspace/ff_venv/bin/pip uninstall -y onnxruntime
/workspace/ff_venv/bin/pip install onnxruntime-gpu --no-cache-dir
chmod +x /workspace/facefusion/run.sh
/workspace/facefusion/run.sh
