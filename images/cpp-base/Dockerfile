# Non-CUDA C++ stack.
FROM dev-base:ubuntu24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc g++ \
    clang clang-tools \
    cmake \
    ccache \
    bear \
    && rm -rf /var/lib/apt/lists/*

ENV CC=clang
ENV CXX=clang++
WORKDIR /work
