#/bin/bash

reset

cd "${0%/*}"
#cp -R ../helper_tools/Python/installer .
# use the GitHub repo as source for the installer

# Check for git 
git --version 2>&1 >/dev/null # improvement by tripleee
GIT_IS_AVAILABLE=$?
# ...
if [ $GIT_IS_AVAILABLE -ne 0 ]
then
      echo "Git is not found!"
      exit
fi

rm -R -f installer

git clone https://github.com/patschwork/meta_grid_install_update.git
mv meta_grid_install_update installer
cd installer
python3 update.py
mgInstallUpdateToolOK=$?
if [ $mgInstallUpdateToolOK -ne 0 ]
then
      echo "There was an error on installing the Meta#Grid Installer-and-Updater-Tool"
      exit
fi
cd ..

export DOCKER_BUILDKIT=0 

docker build . -t meta_grid
rm -R -f installer
