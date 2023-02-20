#!/bin/bash

./stop.sh

xhost +local:root
export DISPLAY=:1.0

docker run -t -d --privileged --net=host \
--name px4 \
-e DISPLAY=$DISPLAY -v $HOME/.Xauthority:/root/.Xauthority:ro \
humble:gazebo
 
 
# -v $PWD/ros_script.sh:/root/source_this.sh \
# -v $PWD/code:/root/code \--env="DISPLAY" \
