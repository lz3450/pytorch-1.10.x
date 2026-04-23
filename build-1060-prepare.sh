#!/usr/bin/env bash
#
# build-1060-prepare.sh
#

set -e
set -o pipefail
set -u
# set -x

umask 0022

################################################################################

wget -qO /tmp/cuda_cluster_pkgs_10.2.89_440.33.01_ubuntu1804.tar.gz https://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run
sudo bash /tmp/cuda_10.2.89_440.33.01_linux.run

python3 -m pip -v wheel --wheel-dir ~/wheels --no-binary :all: setuptools==59.5.0 ninja
python3 -m pip -v install --user -U --no-index --find-links ~/wheels setuptools==59.5.0 ninja
python3 -m pip -v wheel --wheel-dir ~/wheels --no-binary :all: -r requirements.txt
python3 -m pip -v install --user -U --no-index --find-links ~/wheels -r requirements.txt
