## If you would like to build the docker containers here are the commands

## Building

### base

`$ docker build -f Dockerfile . -t sky360/opencv4:base`

`$ docker build -f Dockerfile-cuda . -t sky360/opencv4-cuda:base`

### opencv4.6.0

`$ docker build -f Dockerfile . -t sky360/opencv4:4.6.0`

`$ docker build -f Dockerfile-cuda . -t sky360/opencv4-cuda:4.6.0`

### simple tracker

`$ docker build -f Dockerfile . -t sky360/simpletracker:1.0.0`

`$ docker build -f Dockerfile-cuda . -t sky360/simpletracker-cuda:1.0.0`

## Running

`$ export DISPLAY=:0`

`$ xhost +`

`$ docker run -it --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/simpletracker:1.0.0 bash`

**NOTE** For the CUDA version there is more work to do. You will need to install the nvidia docker container runtime

I used the following to do this:

* [Install nvidia docker container runtime](https://medium.com/ava-information/enabling-gpus-with-nvidia-docker-container-runtime-b4619d9173f5)
* [Install docker compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-22-04)

Remember to restart docker once you have installed the above using: `sudo systemctl restart docker`

Running the CUDA container

`$ docker run -it --runtime=nvidia --gpus all --privileged --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY sky360/simpletracker-cuda:1.0.0 bash`

When inside the CUDA container enable CUDA for Simpletracker:

1. use the nano editor i.e. `nano ./settings.toml` to set the **enable_cuda=false** to **enable_cuda=true**
2. `ctrl x` to save and exit
3. `./run.sh` to run simple tracker

To exit the container type `exit`

Best of luck!
