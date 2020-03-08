#!/usr/bin/env bash

set -e

CONDA_PATH=`which conda`

if [ -z "${CONDA_PATH}" ]; then
    echo "Please check if you have 'conda' installed."
    exit 1;
else
    echo "'conda' found at: '${CONDA_PATH}'"
fi

conda update --all -y

conda clean --all -y

conda list

exit 0