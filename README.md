# docker

## About
This repo contains everything, that is needed to build and run Meta#Grid in a docker container

## Prerequisites
- docker (or Docker Desktop)
- curl
- jq or pip (package-management system for Python)

## Database content
By default, a clean and empty database will be installed.

If you prefer to start with some examples you can do the following:

After cloning this repo, change (... `-initdb=demo`) the content of the following line in the file `dockerfile` into:

`RUN python3 meta-grid_install_or_update.py -u -m=install -initdb=demo`

## Getting started 🚀
Clone this repository.

`git clone https://github.com/Meta-Grid/docker.git`

`cd docker`

Run `./install.sh`: This will do all things. 

When completed: http://localhost:8888

Enjoy :-)

## Tested on
- Ubuntu Linux 22.04
- Pop!_OS 22.04
- MacOS Ventura (Apple Silicon)

[![asciicast](https://asciinema.org/a/qc5eIS7yEiQEH3A6Jt71ABmVC.png?rows=20)](https://asciinema.org/a/qc5eIS7yEiQEH3A6Jt71ABmVC?rows=20)


<script src="https://asciinema.org/a/qc5eIS7yEiQEH3A6Jt71ABmVC.js" id="asciicast-qc5eIS7yEiQEH3A6Jt71ABmVC" async></script>
