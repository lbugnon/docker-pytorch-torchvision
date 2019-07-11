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
RUN make -j4
RUN sudo make install

RUN MKDIR /home/ada/
# TODO hacer un usuario
WORKDIR /home/ada/

RUN python -m pip install --U pip
RUN python -m pip install numpy
RUN python -m pip install pandas

# install from nvidia repositories
RUN wget -nv -P /root/manual http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64/7fa2af80.pub \
 && echo "47217c49dcb9e47a8728b354450f694c9898cd4a126173044a69b1e9ac0fba96  /root/manual/7fa2af80.pub" | sha256sum -c --strict - \
 && apt-key add /root/manual/7fa2af80.pub \
 && wget -nv -P /root/manual http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64/cuda-repo-ubuntu1704_9.1.85-1_amd64.deb \
 && dpkg -i /root/manual/cuda-repo-ubuntu1704_9.1.85-1_amd64.deb \
 && echo 'deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /' > /etc/apt/sources.list.d/nvidia-ml.list \
 && rm -rf /root/manual
RUN apt-get update -qq \
 && apt-get install --no-install-recommends -y \
    # install cuda toolkit
    cuda-toolkit-9-0 \
    cuda-toolkit-9-1 \
    # install cudnn
    libcudnn7=7.0.5.15-1+cuda9.0 \
    libcudnn7-dev=7.0.5.15-1+cuda9.0 \
    libcudnn7=7.0.5.15-1+cuda9.1 \
    libcudnn7-dev=7.0.5.15-1+cuda9.1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# fix issues with shared objects
RUN ls /usr/local/cuda-9.1/targets/x86_64-linux/lib/stubs/* | xargs -I{} ln -s {} /usr/lib/x86_64-linux-gnu/ \
 && ln -s libcuda.so /usr/lib/x86_64-linux-gnu/libcuda.so.1 \
 && ln -s libnvidia-ml.so /usr/lib/x86_64-linux-gnu/libnvidia-ml.so.1
