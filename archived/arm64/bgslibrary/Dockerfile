# v 1.0.0 - Base BGS library with opencv 4.6
# v 1.0.1 - Base BGS library with opencv 4.7

# docker build --no-cache -f Dockerfile . -t sky360/bgslibrary-arm64:1.0.1
# docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/bgslibrary-arm64:1.0.1 bash

FROM sky360/opencv4-arm64:4.7.0

WORKDIR /opt

RUN git clone --recursive https://github.com/Sky360-Repository/bgslibrary.git

# Compile C++ library
WORKDIR /opt/bgslibrary/build
RUN cmake .. && make -j $(nproc)

# Build and install the python wrapper
WORKDIR /opt/bgslibrary
RUN python setup.py build
RUN python setup.py install
ENV PYTHONPATH=$PYTHONPATH:/opt/bgslibrary/build/lib.linux-aarch64-cpython-310

# Compile the C++ QT User Interface
WORKDIR /opt/bgslibrary/gui/qt/build
RUN cmake .. && make -j $(nproc)
RUN cp bgslibrary_gui ../../..

# Compile examples
WORKDIR /opt/bgslibrary/examples/build
RUN cmake .. && make -j $(nproc)