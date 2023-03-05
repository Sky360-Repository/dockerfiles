# v 1.0.0 - Base install with updated and improved WeightedMovingVariance algo
# v 1.0.1 - Now includes new Sky360 blob detection algo
# v 1.0.3 - Including support for qhy cameras and bgs parameters changing

# docker build --no-cache -f Dockerfile . -t sky360/sky360lib-arm64:1.0.3
# docker run -it --privileged --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/bus/usb:/dev/bus/usb -e DISPLAY=$DISPLAY sky360/sky360lib-arm64:1.0.3 bash

FROM sky360/bgslibrary-arm64:1.0.1

# Install Cuda
# WORKDIR /opt
# RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.0-1_all.deb
# RUN dpkg -i cuda-keyring_1.0-1_all.deb
RUN apt-get update && apt-get upgrade -y
# RUN apt -y install cuda
# RUN rm cuda-keyring_1.0-1_all.deb
# ENV PATH=$PATH:/usr/local/cuda:/usr/local/cuda/bin
# ENV CUDA_PATH=/usr/local/cuda

# Install QHY sdk
WORKDIR /opt
RUN wget https://www.qhyccd.com/file/repository/publish/SDK/230228/sdk_Arm64_23.02.28.tgz
RUN tar -xf sdk_Arm64_23.02.28.tgz
RUN rm sdk_Arm64_23.02.28.tgz
WORKDIR /opt/sdk_Arm64_23.02.28
RUN bash install.sh

# Install OpenCL
WORKDIR /opt
RUN apt -y install mesa-utils mesa-common-dev libao-dev freeglut3-dev libglew-dev libglfw3-dev libglm-dev libmpg123-dev
RUN git clone --recursive https://github.com/KhronosGroup/OpenCL-SDK.git
WORKDIR /opt/OpenCL-SDK/build
RUN cmake .. -DOpenGL_GL_PREFERENCE=GLVND -DCMAKE_INSTALL_PREFIX=/usr/local
RUN cmake --build . --target install -j$(nproc)

# Install Halide
#WORKDIR /opt
#RUN wget https://github.com/halide/Halide/releases/download/v14.0.0/Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz
#RUN tar -xf Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz
#RUN rm Halide-14.0.0-x86-64-linux-6b9ed2afd1d6d0badf04986602c943e287d44e46.tar.gz
#ENV Halide_DIR=/opt/Halide-14.0.0-x86-64-linux/
#ENV HalideHelpers_DIR=/opt/Halide-14.0.0-x86-64-linux/

# Install Easy Profiler
WORKDIR /opt
RUN git clone https://github.com/yse/easy_profiler.git
WORKDIR /opt/easy_profiler/build
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN cmake --build . -j$(nproc)
RUN make install

# Install sky360lib
WORKDIR /opt
RUN git clone --recursive https://github.com/Sky360-Repository/sky360lib.git
WORKDIR /opt/sky360lib/build
RUN cmake .. -DCMAKE_PREFIX_PATH=/opt/easy_profiler/lib/cmake/easy_profiler
RUN cmake --build . -j$(nproc)
ENV PYTHONPATH=$PYTHONPATH:/opt/sky360lib/build/lib

WORKDIR /opt/sky360lib
