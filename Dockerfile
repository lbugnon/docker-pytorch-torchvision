FROM nvidia/cuda:9.0-devel-ubuntu17.04                                                                          

RUN apt-get update && apt-get install -y --no-install-recommends \
    	    build-essential \
	    pkg-config \
	    gfortran \
	    libatlas-base-dev \
	    fonts-lyx \
	    libfreetype6-dev \
	    libpng-dev \
	    sudo \
	    python3 \
	    python3-pip \
	    python3-setuptools\
	    imagemagick\
	    wget


RUN python3 -m pip install --U pip
RUN python3 -m pip install numpy
RUN python3 -m pip install pandas
RUN python3 -m pip install torch
RUN python3 -m pip install torchvision
RUN python3 -m pip install sklearn
RUN python3 -m pip install matplotlib


