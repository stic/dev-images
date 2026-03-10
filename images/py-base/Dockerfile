# Base Python ecosystem (keep GPU frameworks OUT; projects add what they need)
FROM dev-base:ubuntu24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-venv python3-pip python3-dev \
    python3-numpy python3-pandas python3-scipy python3-matplotlib \
    python3-yaml python3-requests python3-dateutil \
    python3-pydantic python3-httpx python3-websockets \
    python3-plotly python3-jupyterlab-server python3-ipykernel \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:${PATH}"

EXPOSE 8888
WORKDIR /work
