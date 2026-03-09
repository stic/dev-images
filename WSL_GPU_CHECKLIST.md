# GPU-in-containers checklist (WSL2)

1) Update WSL kernel: `wsl --update` (Windows)
2) Install recent NVIDIA Windows driver that supports WSL2 GPU.
3) Docker Desktop: enable WSL2 backend + GPU support.
4) Validate:

```bash
docker run --rm --gpus all nvidia/cuda:13.1.1-runtime-ubuntu24.04 nvidia-smi
```

Refs:
- Docker Desktop GPU support doc.
- Microsoft Learn: CUDA on WSL.
- NVIDIA CUDA on WSL user guide.
