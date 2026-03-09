#!/usr/bin/env bash
set -euo pipefail

# Start Llama.cpp server in a container
# Assumes you have a model file in the llama-models volume (e.g., /models/model.gguf)
# If not, copy your .gguf file to the volume first:
# docker run --rm -v llama-models:/models -v /host/path/to/model:/host alpine cp /host/model.gguf /models/

MODEL_PATH="/models/model.gguf"  # Change this to your model's path in the volume

echo "Starting Llama.cpp server on port 6060..."
docker run -d --name llama-server --gpus all -p 6060:6060 -v llama-models:/models \
  dev-llama:cuda13.1-cudnn9-ubuntu24.04 \
  llama-server -m "$MODEL_PATH" --host 0.0.0.0 --port 6060 --ctx-size 4096 --threads $(nproc)

echo "Server started. Access at http://localhost:6060"
echo "To stop: docker stop llama-server && docker rm llama-server"
echo "To check logs: docker logs llama-server"