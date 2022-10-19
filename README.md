## If you would like to build the docker containers here are the commands

## Building

### base

`$ docker build --no-cache -f Dockerfile . -t sky360/opencv4:base`

`$ docker build --no-cache -f Dockerfile-cuda . -t sky360/opencv4-cuda:base`

### opencv4.6.0

`$ docker build --no-cache -f Dockerfile . -t sky360/opencv4:4.6.0`

`$ docker build --no-cache -f Dockerfile-cuda . -t sky360/opencv4-cuda:4.6.0`

### BGSLibrary

`$ docker build --no-cache -f Dockerfile . -t sky360/bgslibrary:opencv4.6.0`

`$ docker build --no-cache -f Dockerfile-cuda . -t sky360/bgslibrary-cuda:opencv4.6.0`

### simple tracker

`$ docker build --no-cache -f Dockerfile . -t sky360/simpletracker:1.0.0`

`$ docker build --no-cache -f Dockerfile-cuda . -t sky360/simpletracker-cuda:1.0.0`

### simple tracker ros2

`$ docker build --no-cache -f Dockerfile . -t sky360/simpletracker-ros2:1.0.0`

`$ docker build --no-cache -f Dockerfile-cuda . -t sky360/simpletracker-cuda-ros2:1.0.0`

## Running simple tracker

`$ export DISPLAY=:0`

`$ xhost +`

`$ docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/$USER/Videos/tracker-output:/opt/simpletracker/output -e DISPLAY=$DISPLAY sky360/simpletracker:1.0.0 bash`

When inside the container run simple tracker using the command below:

1. `./run.sh` to run simple tracker

**NOTE** If you want to use a USB type camera, you will need to expose the device to the container, below is an example

`$ docker run -it --rm --device=/dev/video0:/dev/video0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/$USER/Videos/tracker-output:/opt/simpletracker/output -e DISPLAY=$DISPLAY sky360/simpletracker:1.0.0 bash`

**NOTE** For the CUDA version there is more work to do. You will need to install the nvidia docker container runtime

I used the following to do this:

* [Install nvidia docker container runtime](https://medium.com/ava-information/enabling-gpus-with-nvidia-docker-container-runtime-b4619d9173f5)
* [Install docker compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04)

Remember to restart docker once you have installed the above using: `sudo systemctl restart docker`

Running the CUDA container

`$ export DISPLAY=:0`

`$ xhost +`

`$ docker run -it --runtime=nvidia --gpus all --privileged --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/$USER/Videos/tracker-output:/opt/simpletracker/output -e DISPLAY=$DISPLAY sky360/simpletracker-cuda:1.0.0 bash`

When inside the container run simple tracker using the command below:

1. To run Simple Tracker

* `./run.sh`

2. To run through the new Background Subtractors

* `$ cd ../bgslibrary`

* `$ python ./demo2.py`


To exit the container type `exit`


## Running simple tracker ros2

`$ export DISPLAY=:0`

`$ xhost +`

`$ docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/simpletracker-ros2:1.0.0 bash`

When inside the container run simple tracker using the command below:

1. `source /root/.bashrc` to source the ros2 install
2. `./setup.sh` to setup and run the simple tracker ros2

**NOTE** if you see the following error: "/usr/bin/python3.10: No module named rosidl_adapter" in red, then run the following commands: 

Then run the following:

1. `source /root/.bashrc` to source the ros2 install
2. `./build.sh` to setup and run the simple tracker ros2

**NOTE** For the CUDA version there is more work to do. You will need to install the nvidia docker container runtime

I used the following to do this:

* [Install nvidia docker container runtime](https://medium.com/ava-information/enabling-gpus-with-nvidia-docker-container-runtime-b4619d9173f5)
* [Install docker compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04)

Remember to restart docker once you have installed the above using: `sudo systemctl restart docker`

Running the CUDA container

`$ export DISPLAY=:0`

`$ xhost +`

`$ $ docker run -it --runtime=nvidia --gpus all --privileged --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/simpletracker-cuda-ros2:1.0.0 bash`

When inside the container run simple tracker using the command below:

1. `source /root/.bashrc` to source the ros2 install
2. `./setup.sh` to setup and run the simple tracker ros2

**NOTE** if you see the following error: "/usr/bin/python3.10: No module named rosidl_adapter" in red, then run the following commands: 

Then run the following:

1. `source /root/.bashrc` to source the ros2 install
2. `./build.sh` to setup and run the simple tracker ros2

To exit the container type `exit`

Best of luck!