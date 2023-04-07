# docker buildx build --push --platform linux/amd64,linux/arm64 --no-cache -f Dockerfile . -t sky360/gui-openmct:1.0.0 -t sky360/gui-openmct:latest
# docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/gui-openmct:latest bash

# Use the official Ubuntu 22.04 image as the base image
FROM ubuntu:22.04

# Set the working directory
WORKDIR /app

# Set environment variables to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package index and install necessary tools and dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg2 lsb-release git build-essential sqlite3

# Set up the ROS 2 repository and install the Humble distribution
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - && \
    sh -c 'echo "deb http://packages.ros.org/ros2/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    apt-get update && \
    apt-get install -y ros-humble-desktop
    # apt-get install -y --fix-missing ros-galactic-desktop

# Install Node.js (version 19.x)
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && \
    apt-get install -y nodejs


# Clone the OpenMCT repository and install its dependencies
RUN git clone https://github.com/Sky360-Repository/gui-openmct.git openmct
WORKDIR /app/openmct/gui-openmct
# RUN npm install

RUN apt install -y chromium-bsu chromium-browser

# Clone the Rosbridge repository and install its dependencies
WORKDIR /app
RUN git clone https://github.com/RobotWebTools/roslibjs.git roslibjs
WORKDIR /app/roslibjs
RUN npm install

# Copy the OpenMCT and Rosbridge code to the /app directory
COPY . /app

# Expose the port that the OpenMCT server will run on
EXPOSE 8080

# Start the OpenMCT server
WORKDIR /app/openmct/gui-openmct
CMD ["npm", "start"]