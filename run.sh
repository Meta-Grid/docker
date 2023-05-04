#/bin/bash

cd "${0%/*}"

docker run -v $PWD/db:/opt/meta_grid/db -d -p 8888:80 --name meta_grid -t meta_grid:latest