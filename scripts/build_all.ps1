# Build all images (PowerShell version)
# Build order matters

docker build -t dev-base:ubuntu24.04 images/base

docker build -t dev-py:ubuntu24.04 images/py-base

docker build -t dev-cpp:ubuntu24.04 images/cpp-base

# CUDA layer (optional)
docker build -t dev-cuda:cuda13.1-cudnn9-ubuntu24.04 images/cuda

docker build -t dev-py-cuda:cuda13.1-cudnn9-ubuntu24.04 images/py-cuda

docker build -t dev-cpp-cuda:cuda13.1-cudnn9-ubuntu24.04 images/cpp-cuda

# Llama.cpp layer (optional)
docker volume create llama-models -ErrorAction SilentlyContinue
docker build -t dev-llama:cuda13.1-cudnn9-ubuntu24.04 images/llama

Write-Host "Built: dev-base, dev-py, dev-cpp, dev-cuda, dev-py-cuda, dev-cpp-cuda, dev-llama"
Write-Host "To start Llama server: .\scripts\start_llama.ps1 (after adding model to llama-models volume)"