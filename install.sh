#/bin/bash

cd "${0%/*}"

chmod +x build.sh
chmod +x run.sh
chmod +x update.sh

./build.sh

mkdir -p db
# copy the database file to host

FILE=$PWD/db/dwh_meta.sqlite
if [ -f "$FILE" ]; then
    echo "$FILE already exists. Exit."
    exit
fi

# run without volume mount
docker run -d -p 8888:80 --name meta_grid_install -t meta_grid:latest

# copy the file
docker cp meta_grid_install:/opt/meta_grid/db/dwh_meta_inside_docker_container.sqlite $FILE

# kill this instance again
docker kill meta_grid_install
docker rm meta_grid_install

# run the final version with volume mount
./run.sh