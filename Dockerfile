FROM ros:humble

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /root/
COPY requirements.txt requirements.txt

RUN apt clean && rm -rf /var/lib/apt/lists/* && apt update && \
    apt upgrade -y

# Random tools
RUN apt install -y neofetch python3-pip clang wget ca-certificates gnupg \
    astyle build-essential cmake cppcheck file g++ gcc gdb git lcov	\
    libxml2-dev	libxml2-utils make ninja-build python3 python3-dev bc \
	python3-pip python3-setuptools python3-wheel rsync shellcheck unzip zip \
    gstreamer1.0-plugins-bad gstreamer1.0-plugins-base \
	gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly gstreamer1.0-libav \
	libeigen3-dev libgstreamer-plugins-base1.0-dev libimage-exiftool-perl \
	libopencv-dev libxml2-utils pkg-config protobuf-compiler libgazebo-dev \
    python3-rospkg

# Getting Gazebo
RUN wget https://packages.osrfoundation.org/gazebo.gpg -O \
	/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg;
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" \
    | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
    

# Installing ros and gazebo packages
RUN apt update && apt install -y ros-${ROS_DISTRO}-demo-nodes-cpp gz-garden \
    ros-${ROS_DISTRO}-rqt-console

# PX4
RUN git clone https://github.com/PX4/PX4-Autopilot.git --recursive

RUN python3 -m pip install --no-cache-dir -r requirements.txt

USER root
RUN usermod -a -G dialout root

SHELL [ "/bin/bash", "-c" ]

