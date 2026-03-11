# Start Llama.cpp server in a container (PowerShell version)
# Assumes you have a model file in the llama-models volume (e.g., /models/model.gguf)
# If not, copy your .gguf file to the volume first:
# docker create --name copy-models -v llama-models:/models alpine true
# docker cp D:\models\Qwen3-8B-Q5_K_M.gguf copy-models:/models/
# docker rm copy-models

$MODEL_PATH = "/models/Qwen3-8B-Q5_K_M.gguf"  # Change this to your model's path in the volume

Write-Host "Starting Llama.cpp server on port 6060..."
docker run -d --name llama-server --gpus all -p 6060:6060 -v llama-models:/models `
  dev-llama:cuda13.2-cudnn9-ubuntu24.04 `
  llama-server -m $MODEL_PATH --host 0.0.0.0 --port 6060 --ctx-size 8192 --threads $env:NUMBER_OF_PROCESSORS

Write-Host "Server started. Access at http://localhost:6060"
Write-Host "To stop: docker stop llama-server; docker rm llama-server"
Write-Host "To check logs: docker logs llama-server"