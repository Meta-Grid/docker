#/bin/bash

cd "${0%/*}"

# get newest from GitHub ;-)
git checkout .
git reset
git pull

# stop and remove running instance
docker kill meta_grid
docker rm meta_grid

# Do a new build
./build_docker.sh

# use this as update for the database schema
docker run -i -v $PWD/db:/opt/meta_grid/db --name meta_grid_update_db -t meta_grid:latest /bin/bash -c 'cd /opt/meta_grid_updater; python3 meta-grid_install_or_update.py -u -m=update'

# stop and remove running instance
# docker kill meta_grid_update_db
docker rm meta_grid_update_db

chmod +x run_docker.sh
./run_docker.sh
