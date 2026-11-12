#!/bin/bash
set -e
python3 -m venv /workspace/ff_venv
/workspace/ff_venv/bin/pip install --upgrade pip --no-cache-dir
/workspace/ff_venv/bin/pip install -r /workspace/facefusion/requirements.txt --no-cache-dir
/workspace/ff_venv/bin/pip uninstall -y onnxruntime
/workspace/ff_venv/bin/pip install --no-cache-dir onnxruntime-gpu nvidia-cublas-cu12 nvidia-cudnn-cu12 nvidia-cuda-runtime-cu12 nvidia-cufft-cu12 nvidia-curand-cu12 nvidia-cusolver-cu12 nvidia-cusparse-cu12
chmod +x /workspace/facefusion/run.sh
/workspace/facefusion/run.sh
