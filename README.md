## If you would like to build the docker containers here are the commands

If you would like to build the cuda images you will need to have a NVIDIA graphics card as well as the NVIDIA CUDA Toolkit and the NVIDIA CUDA Deep Neural Network library (cuDNN) installed. I have used [this artickle](https://medium.com/@juancrrn/installing-cuda-and-cudnn-in-ubuntu-20-04-for-deep-learning-dad8841714d6) in the past as a reference.

## Building

### base

`$ docker build -f Dockerfile . -t sky360/opencv4:base`

`$ docker build -f Dockerfile-cuda . -t sky360/opencv4-cuda:base`

### opencv4.6.0

`$ docker build -f Dockerfile . -t sky360/opencv4:4.6.0`

`$ docker build -f Dockerfile-cuda . -t sky360/opencv4-cuda:4.6.0`

### BGSLibrary

`$ docker build -f Dockerfile . -t sky360/bgslibrary:opencv4.6.0`

`$ docker build -f Dockerfile-cuda . -t sky360/bgslibrary-cuda:opencv4.6.0`

### simple tracker

`$ docker build -f Dockerfile . -t sky360/simpletracker:1.0.0`

`$ docker build -f Dockerfile-cuda . -t sky360/simpletracker-cuda:1.0.0`

## Running

`$ export DISPLAY=:0`

`$ xhost +`

`$ docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/simpletracker:1.0.0 bash`

When inside the container run simple tracker using the command below:

1. `./run.sh` to run simple tracker

**NOTE** For the CUDA version there is more work to do. You will need to install the nvidia docker container runtime

I used the following to do this:

* [Install nvidia docker container runtime](https://medium.com/ava-information/enabling-gpus-with-nvidia-docker-container-runtime-b4619d9173f5)
* [Install docker compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04)

Remember to restart docker once you have installed the above using: `sudo systemctl restart docker`

Running the CUDA container

`$ export DISPLAY=:0`

`$ xhost +`

`$ docker run -it --runtime=nvidia --gpus all --privileged --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/simpletracker-cuda:1.0.0 bash`

When inside the container run simple tracker using the command below:

1. To run Simple Tracker

* `./run.sh`

2. To run through the new Background Subtractors

* `$ cd ../bgslibrary`

* `$ python ./demo2.py`


To exit the container type `exit`

Best of luck!

