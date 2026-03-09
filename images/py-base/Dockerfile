# Base Python ecosystem (keep GPU frameworks OUT; projects add what they need)
FROM dev-base:ubuntu24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-venv python3-pip python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.cargo/bin:${PATH}"

RUN uv pip install --system \
    "numpy>=2.0" \
    "pandas>=2.2" \
    "polars>=1.0" \
    "pyarrow>=16" \
    "scipy>=1.13" \
    "numba>=0.60" \
    "matplotlib>=3.9" \
    "plotly>=5.22" \
    "jupyterlab>=4.2" \
    "ipykernel>=6.29" \
    "orjson>=3.10" \
    "pyyaml>=6.0" \
    "requests>=2.32" \
    "httpx>=0.27" \
    "websockets>=12.0" \
    "python-dateutil>=2.9" \
    "pydantic>=2.8"

EXPOSE 8888
WORKDIR /work
