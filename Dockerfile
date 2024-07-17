# Start with a base image that includes the necessary build tools
FROM ubuntu:latest

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install dependencies
RUN apt-get update && apt-get install -y \
    mm-common \
    build-essential \
    git \
    meson \
    vim \
    ninja-build \
    pkg-config \
    libgtk-4-dev \
    libgtkmm-4.0-dev \
    && rm -rf /var/lib/apt/lists/*
    # libglibmm-2.4-dev \
    # libsigc++-2.0-dev \

# Set the working directory
WORKDIR /workspace
