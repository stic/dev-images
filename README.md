# Homelab dev images + devcontainer templates (WSL2/Windows)

Goal: keep a **neutral base image** (perf/debug tooling) and layer GPU stacks (CUDA/cuDNN) or non-GPU language stacks on top.

## Image graph

- `dev-base:ubuntu24.04`  -> neutral perf/debug tooling
- `dev-cuda:cuda13.1-cudnn9-ubuntu24.04` -> `dev-base` + CUDA toolkit + cuDNN (apt)
- `dev-py:ubuntu24.04`    -> `dev-base` + Python ecosystem (no CUDA)
- `dev-cpp:ubuntu24.04`   -> `dev-base` + GCC/Clang/CMake (no CUDA)
- `dev-py-cuda:cuda13.1-cudnn9-ubuntu24.04`  -> `dev-cuda` + Python extras you want GPU-aware (kept minimal by default)
- `dev-cpp-cuda:cuda13.1-cudnn9-ubuntu24.04` -> `dev-cuda` + CUDA/C++ extras (kept minimal by default)
- `dev-llama:cuda13.1-cudnn9-ubuntu24.04` -> `dev-py-cuda` + Llama.cpp server (GPU-enabled)

This keeps CUDA as an **optional layer** so you can later create `dev-rocm:*` without collapsing everything.

## Prereqs (host)

- Windows 11 + WSL2 + recent NVIDIA driver that supports WSL GPU.
- Docker Desktop (WSL2 backend) OR Docker Engine inside WSL (not tested)
- For GPU containers: `--gpus all` needs the NVIDIA container runtime on the host.

Refs:
- CUDA install guide (WSL + Ubuntu): repo pin + keyring + `apt install cuda-toolkit` details. 
- cuDNN install guide: `cudnn9-cuda-13` meta package.

## Build

From repo root:

```bash
./scripts/build_all.sh  # Linux/WSL
# OR
.\scripts\build_all.ps1  # Windows PowerShell
```

It builds and tags all images, including the optional Llama layer.

## Local AI (Llama.cpp)

For AI-assisted coding with local models:

1. Build images (includes `dev-llama`).
2. Add your GGUF model to the `llama-models` volume:
   ```bash
   docker run --rm -v llama-models:/models -v /host/path/to/model.gguf:/model.gguf alpine cp /model.gguf /models/
   ```
3. Start the Llama server:
   ```bash
   ./scripts/start_llama.sh  # Linux/WSL
   # OR
   .\scripts\start_llama.ps1  # Windows PowerShell
   ```
4. Use devcontainers with AI integration (e.g., `py-llama/` template includes OpenCode configured for local Llama).

Server runs on `http://localhost:6060`. 
Stop with `docker stop llama-server && docker rm llama-server`.

## Devcontainers (per-project)

Copy one of the folders under `templates/devcontainer/*` into a repo as `.devcontainer/`.

- `py/` and `cpp/` use non-CUDA images
- `py-cuda/` and `cpp-cuda/` use CUDA images
- `py-llama/` uses Python + local AI integration (requires Llama server running)

## Telemetry stack

Bring up Grafana + ClickHouse + Prometheus + Loki:

```bash
docker compose -f telemetry/compose.yaml up -d
```

