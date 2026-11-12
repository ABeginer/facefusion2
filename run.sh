#!/bin/bash
pkill -9 -f "facefusion.py|ffmpeg" 2>/dev/null || true
rm -rf /tmp/gradio/* /tmp/facefusion/* /tmp/facefusion-jobs/* 2>/dev/null || true

export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export VECLIB_MAXIMUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export OPENCV_FOR_THREADS_NUM=1

export NVIDIA_LIBS=$(/workspace/ff_venv/bin/python -c "import os, nvidia; print(':'.join([os.path.join(p, d, 'lib') for p in nvidia.__path__ for d in os.listdir(p) if os.path.isdir(os.path.join(p, d, 'lib'))]))")
export LD_LIBRARY_PATH=$NVIDIA_LIBS:$LD_LIBRARY_PATH
export GRADIO_SERVER_NAME="0.0.0.0"
export GRADIO_SERVER_PORT=7860

cd /workspace/facefusion
/workspace/ff_venv/bin/python facefusion.py run \
  --execution-providers cuda \
  --execution-thread-count 4 \
  --video-memory-strategy tolerant \
  --output-video-encoder libx264 \
  --output-video-preset ultrafast \
  --download-providers huggingface github
