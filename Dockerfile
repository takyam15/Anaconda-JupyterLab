FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y \
sudo \
wget \
vim
WORKDIR /opt
RUN wget https://repo.continuum.io/archive/Anaconda3-2020.02-Linux-x86_64.sh && \
sh /opt/Anaconda3-2020.02-Linux-x86_64.sh -b -p /opt/anaconda3 && \
rm -f Anaconda3-2020.02-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH
RUN pip install --upgrade pip
WORKDIR /
RUN mkdir /work
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]