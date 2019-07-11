#FROM pytorch/pytorch:nightly-devel-cuda9.2-cudnn7
FROM pytorch/pytorch:0.4.1-cuda9-cudnn7-devel

RUN pip install -U pip
RUN pip install torch
RUN pip install torchvision
RUN pip install pandas
RUN pip install sklearn
RUN pip install ipdb
RUN pip install matplotlib


