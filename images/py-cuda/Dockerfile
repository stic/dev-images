# Base Python & CUDA ecosystem (keep GPU frameworks OUT; projects add what they need))
FROM dev-cuda:cuda13.1-cudnn9-ubuntu24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-venv python3-pip python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.cargo/bin:${PATH}"

# Intentionally minimal: will keep adding torch/cupy/jax/etc if needed.
RUN uv pip install --system \
    "numpy>=2.0" \
    "pandas>=2.2" \
    "polars>=1.0" \
    "pyarrow>=16" \
    "jupyterlab>=4.2" \
    "ipykernel>=6.29"

EXPOSE 8888
WORKDIR /work
