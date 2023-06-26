FROM nvidia/cuda:11.7.0-runtime-ubuntu20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pip libgl1-mesa-glx libglib2.0-0 libsm6 libxrender1 libxext6 git
RUN export PIP_EXTRA_INDEX_URL=https://download.pytorch.org/whl/cu117 && pip install torch==1.13.0+cu117 torchvision==0.14.0+cu117
RUN pip install opencv-python terminaltables Pillow yacs pycocotools tensorboard

RUN apt install git -y
ARG CACHEBUST=7
RUN git clone https://github.com/davideNasi/Wolves-Detection-Domain-Adaptation.git
WORKDIR /Wolves-Detection-Domain-Adaptation
RUN apt-get update && apt-get install nano
CMD ["bash","train_adv.sh"]