# Base Python & CUDA ecosystem (keep GPU frameworks OUT; projects add what they need))
FROM dev-cuda:cuda13.2-cudnn9-ubuntu24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-venv python3-pip python3-dev \
    python3-numpy python3-pandas python3-scipy \
    python3-jupyterlab-server python3-ipykernel \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:${PATH}"

EXPOSE 8888
WORKDIR /work
