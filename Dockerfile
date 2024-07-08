# Start with a base image that includes the necessary build tools
FROM ubuntu:latest

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install dependencies
RUN apt-get update && apt-get install -y \
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
WORKDIR /app
RUN mkdir -p /app/src
ADD src /app/src
ADD ./Dockerfile /app/Dockerfile
ADD ./Makefile /app/Makefile

# Make
RUN make module
RUN make install

# Run APP
CMD /app/bin/gtk-app
