#!/bin/bash

# source ros system
source ~/.bashrc

# source ws
source ~/catkin_ws/devel/setup.bash

# source Autoware workspace for pointcloud filter and ndt_mapping if NEEDED
#source /home/punnu/Autoware/ros/devel/setup.bash

# camera and lidar launch + optional mapping
roslaunch qtros carpark_mapping.launch
