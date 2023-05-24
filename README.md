## If you would like to build the docker containers here are the commands

## Building

Before building you need to execute:

`docker buildx create --name builder_mp --use --bootstrap`

Each Dockerfile has the instructions to build the latest version, for instance, for the base:

`docker buildx build --push --platform linux/amd64,linux/arm64 --no-cache -f Dockerfile . -t sky360/base:1.0.1`

Almost all containers will be build for both x64 (amd64) and arm (arm64) architectures. The CUDA version of the containers is only build for x64.

## Running simple tracker

First make sure you run the commands below on a Linux terminal. Sometimes you might need to change the `export DISPLAY=:0` to `export DISPLAY=:1` if you have multiple displays and `0` does not work.

`export DISPLAY=:0`

`xhost +`

Each Dockerfile also has the instruction to run it. For the SimpleTracker, it is as follows, always check the Dockerfile for the latest run command.

`docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/$USER/Videos/tracker-output:/opt/simpletracker/output -e DISPLAY=$DISPLAY sky360/simpletracker:1.0.5 bash`

When inside the container run simple tracker using the command below:

1. `./run.sh` to run simple tracker

**NOTE** If you want to use a USB type camera, you will need to expose the device to the container, below is an example

`docker run -it --rm --device=/dev/video0:/dev/video0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/$USER/Videos/tracker-output:/opt/simpletracker/output -e DISPLAY=$DISPLAY sky360/simpletracker:1.0.2 bash`

**NOTE** For the CUDA version there is more work to do. You will need to install the nvidia docker container runtime

I used the following to do this:

* [Install nvidia docker container runtime](https://medium.com/ava-information/enabling-gpus-with-nvidia-docker-container-runtime-b4619d9173f5)
* [Install docker compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04)

Remember to restart docker once you have installed the above using: `sudo systemctl restart docker`

Running the CUDA container

`export DISPLAY=:0`

`xhost +`

`docker run -it --runtime=nvidia --gpus all --privileged --rm -v /tmp/.X11-unix:/tmp/.X11-unix -v /home/$USER/Videos/tracker-output:/opt/simpletracker/output -e DISPLAY=$DISPLAY sky360/simpletracker-cuda:1.0.2 bash`

When inside the container run simple tracker using the command below:

1. To run Simple Tracker

* `./run.sh`

2. To run through the new Background Subtractors

* `cd ../bgslibrary`

* `python ./demo2.py`


To exit the container type `exit`


## Running simple tracker ros2

`export DISPLAY=:0`

`xhost +`

`docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/simpletracker-ros2:1.0.1 bash`

When inside the container run simple tracker using the command below:

1. `./setup.sh` to setup dependencies for simple tracker ros2
2. `./build.sh` to build simple tracker ros2

**NOTE** if you see the following error: `/usr/bin/python3.10: No module named rosidl_adapter` in red, then rerun the following commands: 

  1. `source /root/.bashrc` to source the ros2 install
  2. `./build.sh` to setup and run the simple tracker ros2

Finally, launch the application using:

3. `./launch.sh` to launch simple tracker ros2

**NOTE** For the CUDA version there is more work to do. You will need to install the nvidia docker container runtime

I used the following to do this:

* [Install nvidia docker container runtime](https://medium.com/ava-information/enabling-gpus-with-nvidia-docker-container-runtime-b4619d9173f5)
* [Install docker compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04)

Remember to restart docker once you have installed the above using: `sudo systemctl restart docker`

Running the CUDA container

`export DISPLAY=:0`

`xhost +`

`docker run -it --runtime=nvidia --gpus all --privileged --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/simpletracker-cuda-ros2:1.0.1 bash`

When inside the container run simple tracker using the command below:

1. `./setup.sh` to setup dependencies for simple tracker ros2
2. `./build.sh` to build simple tracker ros2

**NOTE** if you see the following error: `/usr/bin/python3.10: No module named rosidl_adapter` in red, then rerun the following commands: 

  1. `source /root/.bashrc` to source the ros2 install
  2. `./build.sh` to setup and run the simple tracker ros2

Finally, launch the application using:

3. `./launch.sh` to launch simple tracker ros2

The video will run in a continous loop, so the only way to stop it is by using the command below.

To stop the program type CTRL+C in the docker terminal window. This should shutdown the application.

To exit the container type `exit`

Please remember that these containers don't store state, so if you want to run it again you will need to perform the steps again.

There will be a number of windows that spawn once the program runs, they are all the topics currently available. Let MikeG know if there are too many and he can tweak the docker build script.

Best of luck!


# Testing visualization of codebase
[Link to visualization](https://mango-dune-07a8b7110.1.azurestaticapps.net/?repo=Sky360-Repository%2Fdockerfiles)
