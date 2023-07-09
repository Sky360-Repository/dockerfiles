
# docker buildx build --push --platform linux/amd64,linux/arm64 --no-cache -f Dockerfile . -t sky360/bgslibrary:1.0.6 -t sky360/bgslibrary:latest
# docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/bgslibrary:latest bash

FROM sky360/opencv4:latest
ARG TARGETARCH

WORKDIR /opt

RUN git clone --recursive https://github.com/Sky360-Repository/bgslibrary.git && \
    mkdir -p /opt/bgslibrary/build && cd /opt/bgslibrary/build && \
    cmake .. && make -j $(nproc) && \
    cd /opt/bgslibrary && \
    python setup.py build && \
    python setup.py install && \
    mkdir -p /opt/bgslibrary/gui/qt/build && \
    cd /opt/bgslibrary/gui/qt/build && \
    cmake .. && make -j $(nproc) && \
    cp bgslibrary_gui ../../..

# # Compile C++ library
# WORKDIR /opt/bgslibrary/build
# RUN cmake .. && make -j $(nproc)

# # Build and install the python wrapper
# WORKDIR /opt/bgslibrary
# RUN python setup.py build
# RUN python setup.py install
ENV PYTHONPATH=$PYTHONPATH:/opt/bgslibrary/build/lib.linux-x86_64-cpython-310:/opt/bgslibrary/build/lib.linux-aarch64-cpython-310

# Compile the C++ QT User Interface
# WORKDIR /opt/bgslibrary/gui/qt/build
# RUN cmake .. && make -j $(nproc)
# RUN cp bgslibrary_gui ../../..

# Compile examples
# WORKDIR /opt/bgslibrary/examples/build
# RUN cmake .. && make -j $(nproc)