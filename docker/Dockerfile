FROM osrf/ros:kinetic-desktop-full

ARG DEBIAN_FRONTEND noninteractive
WORKDIR ~/catkin_ws/src/

# Base tools
RUN apt-get update && apt-get install -y --no-install-recommends \
	git \
	vim \
	curl \
	build-essential \
	libgoogle-glog-dev \
	libgflags-dev \
	libatlas-base-dev \
	libeigen3-dev \
	libsuitesparse-dev

# Update Cmake
RUN curl -s "https://cmake.org/files/v3.23/cmake-3.23.1-linux-x86_64.tar.gz" | tar --strip-components=1 -xz -C /usr/local

# Install Ceres Solver
WORKDIR ~/catkin_ws
RUN git clone --depth=1 -b 1.13.0 https://ceres-solver.googlesource.com/ceres-solver \
	&& cd ceres-solver && mkdir build && cd build \
	&& cmake .. && make install


# Setup PL-VIO repo
WORKDIR ~/catkin_ws/src/
RUN git clone https://github.com/netdrones/PL-VIO.git \
	&& cd .. \
	&& /bin/bash -c '. /opt/ros/kinetic/setup.bash; catkin_make'

RUN echo source /opt/ros/kinetic/setup.bash >> ~/.bash_profile
