# v 1.0.0 - Base install with updated and improved WeightedMovingVariance algo
# v 1.0.1 - Now includes new Sky360 blob detection algo
# v 1.0.3 - Including support for qhy cameras and bgs parameters changing
# v 1.0.4 - Making it multi-architecture
# v 1.0.5 - Version bump
# v 1.0.6 - Version bump
# v 1.0.7 - Version bump

# docker buildx build --push --platform linux/amd64,linux/arm64 --no-cache -f Dockerfile . -t sky360/sky360lib:1.0.7 -t sky360/sky360lib:latest
# docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/sky360lib:latest bash

FROM sky360/sky360lib-dev:latest as base

# Install sky360lib
WORKDIR /opt
RUN git clone --recursive https://github.com/Sky360-Repository/sky360lib.git
WORKDIR /opt/sky360lib/build
RUN cmake ..
RUN cmake --build . -j$(nproc)
ENV PYTHONPATH=$PYTHONPATH:/opt/sky360lib/build/lib

WORKDIR /opt/sky360lib
