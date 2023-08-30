# Docker on Maxwell

This repository contains a getting-started with Docker/Singularity containers on the
UHH Maxwell cluster.
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

What you'll need:
- A GitHub account
- A DockerHub account
- Access to the Maxwell cluster

## What is Docker?

[Docker in 100 seconds](https://www.youtube.com/watch?v=Gjnup-PuquQ)

## What is Singularity?

[Nice article that briefly compares Docker and Singularity](https://pythonspeed.com/articles/containers-filesystem-data-processing/#:~:text=Singularity%20is%20a%20container%20runtime,container%2C%20and%20providing%20reproducible%20images.).

## Setting up the GitHub repo

- create repo
- add Dockerfile
- add basic CI/CD workflow
- add the Dockerhub API key and username to the repository secrets

## Versioning your images
- add additional CI/CD workflow for tagged commits

## Pulling the image to Maxwell
- setup of env variables
- example command to build/convert image

## Set up VSCode to run in singularity
- example on how to set up
- demo with video



