# CUDA is an OPTIONAL layer.
# Uses NVIDIA's official repo instructions (pin + keyring) and installs CUDA toolkit + cuDNN via apt.
FROM dev-base:ubuntu24.04

ARG DEBIAN_FRONTEND=noninteractive
ARG CUDA_DISTRO=ubuntu2404
ARG CUDA_ARCH=x86_64

# 1) Repo pin (prioritize CUDA repo)
# 2) Keyring
# 3) Install pinned toolkit (avoid auto-upgrades): cuda-toolkit-13-1
# 4) Install cuDNN meta-package for CUDA 13: cudnn9-cuda-13
#
# Sources:
# - CUDA install guide shows: cuda-<distro>.pin -> /etc/apt/preferences.d/cuda-repository-pin-600 and cuda-keyring.
# - cuDNN install guide shows: apt install cudnn9-cuda-13
RUN set -eux; \
    wget -q https://developer.download.nvidia.com/compute/cuda/repos/${CUDA_DISTRO}/${CUDA_ARCH}/cuda-${CUDA_DISTRO}.pin; \
    mv cuda-${CUDA_DISTRO}.pin /etc/apt/preferences.d/cuda-repository-pin-600; \
    wget -q https://developer.download.nvidia.com/compute/cuda/repos/${CUDA_DISTRO}/${CUDA_ARCH}/cuda-keyring_1.1-1_all.deb; \
    dpkg -i cuda-keyring_1.1-1_all.deb; \
    rm -f cuda-keyring_1.1-1_all.deb; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      cuda-toolkit-13-1 \
      cudnn9-cuda-13 \
      libcudnn9-samples \
      && rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/local/cuda/bin:${PATH}"
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"

RUN nvcc --version
