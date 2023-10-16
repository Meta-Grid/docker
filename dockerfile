FROM ubuntu

RUN apt-get update
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt-get install -y python3 python3-distutils sudo apache2 libapache2-mod-php php-cli php-common php-curl php-gd php-json php-mbstring mcrypt php-opcache php-readline php-sqlite3 php-xml php-xmlrpc php-xsl php-zip php-intl composer sqlite3 python3 openjdk-8-jre
RUN mkdir -p /opt/meta_grid_updater
WORKDIR /opt/meta_grid_updater
COPY installer .
RUN python3 meta-grid_install_or_update.py -u -m=install -initdb=clean
RUN mv /opt/meta_grid/db/dwh_meta.sqlite /opt/meta_grid/db/dwh_meta_inside_docker_container.sqlite
RUN echo 'memory_limit = -1' >> /etc/php/8.1/apache2/conf.d/docker-php-memlimit.ini;
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]

# to run interactivly:
#   docker run -i --name meta_grid -t meta_grid:latest /bin/bash

# run a update
#   docker kill meta_grid
#   docker rm meta_grid
#   docker run -i -v $PWD/db:/opt/meta_grid/db -p 8888:80 --name meta_grid -t meta_grid:latest /bin/bash -c 'cd /opt/meta_grid_updater; python3 meta-grid_install_or_update.py -u -m=update'
