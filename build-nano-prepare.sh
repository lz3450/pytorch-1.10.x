#!/usr/bin/env bash
#
# build-prepare.sh
#

set -e
set -o pipefail
set -u
# set -x

umask 0022

################################################################################

python3 -m pip -v wheel --wheel-dir ~/wheels --no-binary :all: -r requirements.txt
python3 -m pip -v install --user -U --no-index --find-links ~/wheels -r requirements.txt
