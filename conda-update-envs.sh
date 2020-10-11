#!/usr/bin/env bash

set -e

echo "Starting update Conda enviroments..."

echo "Updating env -> base"

source ~/.bash_profile 

conda-update

echo "Updating env -> python36"

conda activate python36

conda-update

echo "Updating env -> python37"

conda activate python37

conda-update

echo "Updating env -> python38"

conda activate python38

conda-update