# docker

## About
This repo contains everything, that is needed to build and run Meta#Grid in a docker container

## Prerequisites
Install docker (or Docker Desktop).

## Database content
By default, a clean and empty database will be installed.

If you prefer to start with some examples you can do the following:

After cloning the repo change the following line in the file `dockerfile`:

`RUN python3 meta-grid_install_or_update.py -u -m=install -initdb=demo`

## Getting started
Clone this repository.

`git clone git@github.com:Meta-Grid/docker.git`

`cd docker`

Run install.sh (`./install.sh`): This will do all things. 

When completed: http://localhost:8888

Enjoy :-)

## Tested on
- Ubuntu Linux 22.04
- Pop OS 22.04
- MacOS Ventura (Apple Silicon)
