# docker build --no-cache -f Dockerfile . -t sky360/dl-ros2:base

FROM sky360/ros2-humble-cuda-dev:opencv4.6.0

WORKDIR /opt

RUN git clone --recursive https://github.com/dusty-nv/jetson-inference.git
# pip install jetson-utils

# Compile Jetson Inference library
WORKDIR /opt/jetson-inference/build
RUN cmake ../ && make -j$(nproc) && make install && ldconfig