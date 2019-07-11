FROM pytorch/pytorch:nightly-devel-cuda9.2-cudnn7

RUN pip install torchvision
RUN pip install pandas
RUN pip install sklearn
RUN pip install ipdb
RUN pip install matplotlib


