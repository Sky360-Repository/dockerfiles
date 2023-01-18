# v 1.0.0 - Base install
# v 1.0.1 - Now includes updated and improved WeightedMovingVariance algo
# v 1.0.2 - Now includes new Sky360 blob detection algo
# v 1.0.3 - Now includes support for qhy cameras and both sky360 and simple blob detectors

# docker build --no-cache -f Dockerfile . -t sky360/simpletracker:1.0.3
# docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/simpletracker:1.0.3 bash

# if you get an error similar to this: 
#    error: (-2:Unspecified error) Can’t initialize GTK backend in function
# 1. ensure ou have exported your display i.e. edit the ~/.bashrc file and add 'export DISPLAY=:0' (excl the ' quotes) 
# where 0 is the index of your display. Its normally 0 but for me its 1
# 2. then run xhost +
#
# ./run.sh


FROM sky360/sky360lib:1.0.2

RUN apt-get update && apt-get install -y \
  python3-pip

WORKDIR /opt

RUN git clone --recursive https://github.com/Sky360-Repository/simpletracker.git

WORKDIR /opt/simpletracker
RUN pip install dynaconf
