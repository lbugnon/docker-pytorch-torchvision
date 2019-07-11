FROM debian:stretch                                                                          
RUN apt-get update && apt-get install -y --no-install-recommends \
    	    build-essential \
	    pkg-config \
	    gfortran \
	    libatlas-base-dev \
	    fonts-lyx \
	    libfreetype6-dev \
	    libpng-dev \
	    sudo \
	    imagemagick\
	    wget


RUN wget --no-check-certificate http://www.python.org/ftp/python/3.7.4/Python-3.7.4.tar.xz
RUN tar -xf Python-3.7.4.tar.xz
WORKDIR Python-3.7.4/
RUN ./configure --enable-optimizations
RUN make 
RUN make test
RUN sudo make install

RUN MKDIR /home/ada/
# TODO hacer un usuario
WORKDIR /home/ada/

RUN python -m pip install --U pip
RUN python -m pip install numpy
RUN python -m pip install pandas
