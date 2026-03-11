# CUDA is an OPTIONAL layer.
# Uses NVIDIA's official repo instructions (pin + keyring) and installs CUDA toolkit + cuDNN via apt.
FROM dev-base:ubuntu24.04

ARG DEBIAN_FRONTEND=noninteractive
ARG CUDA_DISTRO=wsl-ubuntu
ARG CUDA_ARCH=x86_64

RUN set -eux; \
    wget -q https://developer.download.nvidia.com/compute/cuda/repos/${CUDA_DISTRO}/${CUDA_ARCH}/cuda-keyring_1.1-1_all.deb; \
    dpkg -i cuda-keyring_1.1-1_all.deb; \
    rm -f cuda-keyring_1.1-1_all.deb; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      gcc \
      cuda-toolkit-13-2 \
      && rm -rf /var/lib/apt/lists/*

ARG CUDA_DISTRO=ubuntu2404
ARG CUDA_ARCH=x86_64

RUN set -eux; \
    wget -q https://developer.download.nvidia.com/compute/cuda/repos/${CUDA_DISTRO}/${CUDA_ARCH}/cuda-keyring_1.1-1_all.deb; \
    dpkg -i cuda-keyring_1.1-1_all.deb; \
    rm -f cuda-keyring_1.1-1_all.deb; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      zlib1g \
      cudnn9-cuda-13-2 \
      libcudnn9-samples \
      && rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/local/cuda/bin:${PATH}"
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:/usr/local/cuda/lib64/stubs:${LD_LIBRARY_PATH}"

RUN nvcc --version
