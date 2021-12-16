

#sudo docker run -d -it --name nvc --rm --net=host -v /home/paul/uap:/app --runtime nvidia nvcr.io/nvidia/l4t-ml:r32.6.1-py3

sudo docker run -it --runtime=nvidia --gpus all --privileged -v /home/paul/uap/simpletracker/:/app opencv-cuda
