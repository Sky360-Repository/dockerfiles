# docker build --no-cache -f Dockerfile . -t sky360/sky360lib:1.0.0
# docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/sky360lib:1.0.0 bash

FROM sky360/opencv4:4.6.0

# Install Cuda
WORKDIR /opt

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
RUN dpkg -i cuda-keyring_1.0-1_all.deb
RUN apt update
RUN apt -y install cuda
RUN rm cuda-keyring_1.0-1_all.deb
ENV PATH=$PATH:/usr/local/cuda:/usr/local/cuda/bin
ENV CUDA_PATH=/usr/local/cuda

# Install Halide
RUN wget https://github.com/halide/Halide/releases/download/v14.0.0/Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz
RUN tar -xf Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz
RUN rm Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz
ENV Halide_DIR=/opt/Halide-14.0.0-x86-64-linux/
ENV HalideHelpers_DIR=/opt/Halide-14.0.0-x86-64-linux/

# Install sky360lib
RUN git clone --recursive https://github.com/Sky360-Repository/sky360lib.git

WORKDIR /opt/sky360lib/build
RUN cmake .. 
RUN cmake --build . -j$(nproc)
ENV PYTHONPATH=$PYTHONPATH:/opt/sky360lib/build/lib

WORKDIR /opt/sky360lib