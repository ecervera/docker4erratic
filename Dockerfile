FROM ros:kinetic-ros-base

RUN apt-get update && apt-get install -y \
      ros-kinetic-tf ros-kinetic-angles zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /rosbuild_ws

COPY erratic_robot /rosbuild_ws/erratic_robot

SHELL ["/bin/bash", "-c"]
 
RUN source /opt/ros/kinetic/setup.bash \
 && export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:/rosbuild_ws/erratic_robot \
 && rosmake erratic_player erratic_teleop

