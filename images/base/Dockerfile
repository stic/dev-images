FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

# Neutral base: perf/debug/net tooling
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl wget git openssh-client \
    zstd unzip xz-utils \
    tzdata \
    build-essential pkg-config ninja-build \
    gdb lldb \
    strace ltrace \
    valgrind \
    linux-tools-common \
    iproute2 iputils-ping net-tools ethtool \
    sysstat procps psmisc \
    numactl hwloc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work
