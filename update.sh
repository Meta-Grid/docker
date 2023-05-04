#/bin/bash

cd "${0%/*}"

# stop and remove running instance
docker kill meta_grid
docker rm meta_grid

# inside update with a new docker pull or build.sh ????

# this will update the database schema at least
docker run -i -v $PWD/db:/opt/meta_grid/db -p 8888:80 --name meta_grid -t meta_grid:latest /bin/bash -c 'cd /opt/meta_grid_updater; python3 meta-grid_install_or_update.py -u -m=update'

# will this also work for inside updates ????

# stop and remove running instance
docker kill meta_grid
docker rm meta_grid

./run.sh