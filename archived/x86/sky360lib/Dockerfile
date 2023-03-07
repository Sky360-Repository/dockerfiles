# v 1.0.0 - Base install with updated and improved WeightedMovingVariance algo
# v 1.0.1 - Now includes new Sky360 blob detection algo
# v 1.0.3 - Including support for qhy cameras and bgs parameters changing
# v 1.0.4 - Making it multi-architecture

# docker buildx build --push --platform linux/amd64,linux/arm64 --no-cache -f Dockerfile . -t sky360/sky360lib:1.0.4
# docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/sky360lib:1.0.4 bash

FROM sky360/bgslibrary:1.0.2 as base
ARG TARGETARCH

RUN apt-get update && apt-get upgrade -y

FROM base AS base-amd64
# Install QHY sdk
WORKDIR /opt
RUN wget https://www.qhyccd.com/file/repository/publish/SDK/230228/sdk_linux64_23.02.28.tgz
RUN tar -xf sdk_linux64_23.02.28.tgz
RUN rm sdk_linux64_23.02.28.tgz
WORKDIR /opt/sdk_linux64_23.02.28
RUN bash install.sh

FROM base AS base-arm64
WORKDIR /opt
RUN wget https://www.qhyccd.com/file/repository/publish/SDK/230228/sdk_Arm64_23.02.28.tgz
RUN tar -xf sdk_Arm64_23.02.28.tgz
RUN rm sdk_Arm64_23.02.28.tgz
WORKDIR /opt/sdk_Arm64_23.02.28
RUN bash install.sh

FROM base-${TARGETARCH} AS final

# Install OpenCL
WORKDIR /opt
RUN apt -y install mesa-utils mesa-common-dev libao-dev freeglut3-dev libglew-dev libglfw3-dev libglm-dev libmpg123-dev
RUN git clone --recursive https://github.com/KhronosGroup/OpenCL-SDK.git
WORKDIR /opt/OpenCL-SDK/build
RUN cmake .. -DOpenGL_GL_PREFERENCE=GLVND -DCMAKE_INSTALL_PREFIX=/usr/local
RUN cmake --build . --target install -j$(nproc)

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
