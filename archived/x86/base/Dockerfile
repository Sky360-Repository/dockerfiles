# docker buildx create --name builder_mp --use --bootstrap
# docker buildx build --push --platform linux/amd64,linux/arm64 --no-cache -f Dockerfile . -t sky360/base:1.0.1

FROM ubuntu:22.04

WORKDIR /tmp

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
RUN apt-get update && apt-get upgrade 
RUN apt-get install -y \
    build-essential \
    cmake \
    pkg-config \
    wget \
    git \
    unzip \
    nano \
    curl \
    libgtk-3-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    gfortran \
    openexr \
    libatlas-base-dev \
    python3-dev \
    python3-numpy \
    libtbb2 \
    libtbb-dev \
    #libdc1394-22-dev \
    libdc1394-dev \
    libopenexr-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer1.0-dev \
    #qt5-default
    qtbase5-dev \
    qtchooser \
    qt5-qmake \
    qtbase5-dev-tools

# Install boost
RUN apt-get install -y libboost-all-dev

# Install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN apt-get autoclean && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
