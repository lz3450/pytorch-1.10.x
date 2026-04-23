#!/usr/bin/env bash
#
# build-1060.sh
#

set -e
set -o pipefail
set -u
# set -x

umask 0022

################################################################################

export CMAKE_GENERATOR=Ninja
export MAX_JOBS=2

export BUILD_TEST=False
export USE_DISTRIBUTED=OFF

export PYTORCH_BUILD_VERSION=1.10.3
export PYTORCH_BUILD_NUMBER=0

export TORCH_CUDA_ARCH_LIST="5.3"

python3 setup.py clean
python3 setup.py build --cmake-only > build.log 2>&1
ccmake build
cp -v build/CMakeCache.txt build-CMakeCache.txt
python3 setup.py build

# python3 setup.py install --user
# python3 setup.py bdist_wheel
