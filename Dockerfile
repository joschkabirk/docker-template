FROM python:3.11

# If you want to use this as an image for VSCode remote development, you need to 
# install either curl or wget
RUN apt-get update && apt-get install -y curl wget git

RUN pip install numpy

# This is required if you want to use slurm inside the container
# (in addition to the slurm installation on the host machine, and
# the corresponding libraries mounted into the container)
RUN adduser --disabled-password --gecos "" slurm