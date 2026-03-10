# Llama.cpp image for local AI inference (GPU-enabled)
FROM dev-py-cuda:cuda13.2-cudnn9-ubuntu24.04

ARG DEBIAN_FRONTEND=noninteractive

# Install build dependencies for llama.cpp
RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake build-essential git \
    libssl-dev libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone and build llama.cpp -DCMAKE_CUDA_ARCHITECTURES=86 for RTX 30** series (as docker build might not pick it up on Windows)
RUN git clone https://github.com/ggerganov/llama.cpp.git /tmp/llama.cpp && \
    cd /tmp/llama.cpp && \
    mkdir build && cd build && \
    cmake .. -DLLAMA_BUILD_SERVER=ON -DLLAMA_CUDA=ON -DLLAMA_BUILD_EXAMPLES=OFF -DCMAKE_CUDA_ARCHITECTURES=86 && \
    make -j$(nproc) && \
    make install && \
    cd / && rm -rf /tmp/llama.cpp

# Expose port for llama server
EXPOSE 6060

WORKDIR /work