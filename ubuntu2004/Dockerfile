# Use the official Ubuntu 20.04 base image
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install required dependencies
RUN apt-get update && \
    apt-get install -y \
        wget \
        tar \
        gzip \
        make \
        build-essential \
        libgmp-dev \
        libmpfr-dev \
        libmpc-dev \
        libz-dev \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and extract GCC 13 source code
RUN cd /opt && \
    wget https://ftp.gnu.org/gnu/gcc/gcc-13.2.0/gcc-13.2.0.tar.gz && \
    tar -xvzf gcc-13.2.0.tar.gz && \
    rm gcc-13.2.0.tar.gz

# Build GCC 13
RUN cd /opt/gcc-13.2.0 && \
    ./configure --disable-multilib --enable-languages=c,c++ && \
    make -j$(nproc) && \
    make install

# Set GCC 13 as the default compiler
RUN update-alternatives --install /usr/bin/gcc gcc /usr/local/bin/gcc 130 --slave /usr/bin/g++ g++ /usr/local/bin/g++ && \
    update-alternatives --config gcc

# Verify GCC version
RUN gcc --version && g++ --version

# Set the working directory
WORKDIR /workspace

# Default command
CMD ["/bin/bash"]