FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev \
libavformat-dev libswscale-dev python-dev python-numpy libtbb2 libtbb-dev \
libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev unzip libgtk-3-dev libeigen3-dev \
x11-xserver-utils libcanberra-gtk3-module graphviz

RUN apt-get install -y wget

RUN \	
    mkdir ~/opencv_build && cd ~/opencv_build \
    &&\	
    git clone https://github.com/opencv/opencv.git \
    &&\
    git clone https://github.com/opencv/opencv_contrib.git \
    &&\	
    cd ~/opencv_build/opencv\
    &&\	
    mkdir build\
    &&\	
    cd build\
    &&\	
    cmake \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D INSTALL_C_EXAMPLES=ON \
        -D INSTALL_PYTHON_EXAMPLES=ON \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D OPENCV_EXTRA_MODULES_PATH=~/opencv_build/opencv_contrib/modules \
        -D BUILD_EXAMPLES=ON \
        -D BUILD_NEW_PYTHON_SUPPORT=ON \
        -D WITH_FFMPEG=ON \
        -D WITH_TBB=ON \
        -D WITH_V4L=ON \
        -D WITH_QT=ON \
        -D WITH_GTK=ON \
        -D WITH_OPENGL=ON \
        -D WITH_GSTREAMER=ON \
        ..\
    &&\
    make -j4 \
    &&\	
    make install


COPY . /home/Project


RUN \
    cd /home/Project/CAPE  \
    && \
    mkdir build && cd build \
    && \
    cmake .. \
    &&\
    make 
