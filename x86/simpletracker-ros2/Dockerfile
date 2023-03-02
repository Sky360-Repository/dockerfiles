
# docker build --no-cache -f Dockerfile . -t sky360/simpletracker-ros2:1.0.2
# docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/simpletracker-ros2:1.0.2 bash

# if you get an error similar to this: 
#    error: (-2:Unspecified error) Can’t initialize GTK backend in function
# 1. ensure ou have exported your display i.e. edit the ~/.bashrc file and add 'export DISPLAY=:0' (excl the ' quotes) 
# where 0 is the index of your display. Its normally 0 but for me its 1
# 2. then run xhost +
#
# Run the following commands at the command prompt one by one to get the application up and running
#
# source /root/.bashrc
# ./setup.sh
#
# if you see the following error: "/usr/bin/python3.10: No module named rosidl_adapter" in red, then run the following commands: 
#
# source /root/.bashrc
# ./build.sh

FROM sky360/ros2-humble-full:1.0.3

# ** [Optional] Uncomment this section to install additional packages. **

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
   && apt-get -y install --no-install-recommends python3-numpy libboost-python-dev \
   # ROS2 build related stuff
   && pip3 install setuptools==58.2.0 \
   && export PYTHONWARNINGS=ignore:::setuptools.command.install \
   && apt-get autoremove -y \
   && apt-get clean -y
   #&& rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=dialog

WORKDIR /home/ros

RUN echo "if [ -f /home/ros/simpletracker-ros2-ws/install/setup.bash ]; then source /home/ros/simpletracker-ros2-ws/install/setup.bash; fi" >> /home/ros/.bashrc

RUN git clone --recursive https://github.com/Sky360-Repository/simpletracker-ros2-ws.git

RUN chown -R ros:ros /home/ros/simpletracker-ros2-ws

WORKDIR /home/ros/simpletracker-ros2-ws

#RUN ./setup.sh
#RUN source /root/.bashrc

#RUN sed -i -- "s/#('sky360/('sky3602/g" ./src/simple_tracker_launch/launch/simple_tracker_launch.py