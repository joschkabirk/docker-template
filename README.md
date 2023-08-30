# Docker on Maxwell

This repository contains a getting-started with Docker/Singularity containers on the
[UHH Maxwell cluster](https://confluence.desy.de/display/MXW/).
If you see this as a non-UHH person but try to figure out how to run Docker containers
on another HPC, this should be applicable to your environment as well (assuming
your cluster has `singularity` installed).


## TL;DR
- Docker containers allow users to create *isolated* and *reproducible* environments
  where especially the *reproducible* part is crucial for computing in Science
- Singularity is a container runtime that is installed on most HPCs and can run
  Docker containers
- Using docker/singularity containers can be seen as a more robust alternative
  to conda environments (if we just talk about creating python environments)
- Once set up, singularity allows you and your colleagues to use exactly the
  same environment. **no more "it works on my machine"**

**Note**:
Singularity has been renamed to Apptainer some time ago, but the Maxwell cluster
still uses a version which is called `singularity`. Just so you won't be confused when
you google stuff about commands etc. at some point.

### What you'll need:

**For running containers on the cluster**:
- Access to the cluster

**For creating your own containers**:
- A GitHub account
- A DockerHub account

Strictly speaking, you don't need a GitHub account to create your own containers,
but it is a good idea to use GitHub to version your Dockerfiles and to use GitHub
Actions to automatically build and push your images to DockerHub.

## What is Docker?

[Docker in 100 seconds](https://www.youtube.com/watch?v=Gjnup-PuquQ)

## What is Singularity?

[Nice article that briefly compares Docker and Singularity](https://pythonspeed.com/articles/containers-filesystem-data-processing/#:~:text=Singularity%20is%20a%20container%20runtime,container%2C%20and%20providing%20reproducible%20images.).

## Running Docker containers on Maxwell
This section will guide you through the process of setting everything up for
running Docker containers on Maxwell using Singularity.

For this, we assume that you have the name/url of a docker image that you want
to run.
Later sections will explain how you can create your own images and can 
build/version/manage them using GitHub and DockerHub.

### Mandatory configuration
In order to avoid running into storage limit problems, we will assign the
singularity cache to a directory in your `/beegfs` directory (this is 
Maxwell-specific).

First we create a directory where we want to store the cache and the temporary
files created by singularity:
```bash
mkdir -p /beegfs/desy/user/$USER/.singularity/cache
mkdir -p /beegfs/desy/user/$USER/.singularity/tmp
```

Then we need to tell singularity to use these directories by setting the
environment variables `SINGULARITY_CACHEDIR` and `SINGULARITY_TMPDIR`.

Add the following to your `.bashrc` (or `.zshrc` if you use zsh):
```bash
export SINGULARITY_CACHEDIR=/beegfs/desy/user/$USER/.singularity/cache
export SINGULARITY_TMPDIR=/beegfs/desy/user/$USER/.singularity/tmp
```

### Running your first container
With this setup, you can now run your first container.
For this, we will use the `hello-world` container from DockerHub.

```shell
singularity run docker://hello-world
```

You should see the following output:

```shell
INFO:    Converting OCI blobs to SIF format
INFO:    Starting build...
Getting image source signatures
Copying blob 719385e32844 done
Copying config 0dcea989af done
Writing manifest to image destination
Storing signatures
2023/08/30 17:56:13  info unpack layer: sha256:719385e32844401d57ecfd3eacab360bf551a1491c05b85806ed8f1b08d792f6
INFO:    Creating SIF file...
WARNING: passwd file doesn't exist in container, not updating
WARNING: group file doesn't exist in container, not updating

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
 ```
 
**What happened here?**
When you executed the `singularity run` command, singularity first downloaded
the docker image from DockerHub and then converted it to a singularity image
(`.sif` file).
After that, it executed the image and streamed the output to your terminal.
The output `Hello from Docker!` and the lines after that are the output of 
the `hello-world` container.

## Setting up the GitHub repo

- create repo
- add Dockerfile
- add basic CI/CD workflow
- add the Dockerhub API key and username to the repository secrets

## Versioning your images
- add additional CI/CD workflow for tagged commits

## Pulling the image to Maxwell
- example command to build/convert image

## Set up VSCode to run in singularity
- example on how to set up
- demo with video



