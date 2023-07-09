
# docker buildx build --push --platform linux/amd64,linux/arm64 --no-cache -f Dockerfile . -t sky360/sky360lib:1.1.0 -t sky360/sky360lib:latest
# docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/sky360lib-new:latest bash

FROM sky360/sky360lib-dev:latest as base

# Install sky360lib
RUN cd /opt && \
    git clone --recursive https://github.com/Sky360-Repository/sky360lib.git && \
    mkdir -p /opt/sky360lib/build && \
    cd /opt/sky360lib/build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    cmake --build . -j$(nproc) && \
    make install

ENV PYTHONPATH=$PYTHONPATH:/opt/sky360lib/build/lib

WORKDIR /opt/sky360lib
