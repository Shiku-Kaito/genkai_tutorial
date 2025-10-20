#!/bin/bash

# Define the base path for Miniconda
# for workstation
# MINICONDA_PATH="/home/miniconda3/bin"

# for local
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh


# Define the paths to the conda executable and the activate script
CONDA_PATH="$HOME/miniconda3/bin/conda"

# Initialize Miniconda and activate the base environment
$CONDA_PATH init bash

echo "==> EXTRA CONFIGURATION"

# remove default channel
$CONDA_PATH config --remove channels defaults
expected_channels="channels:
  - conda-forge"
echo "$expected_channels" > ~/miniconda3/.condarc

# Add conda-forge as the highest priority channel
$CONDA_PATH config --add channels conda-forge

# Update conda and override all other channels with conda-forge
$CONDA_PATH update -n base conda -c conda-forge --override-channels

# Get the current channel configuration
current_channels=$($CONDA_PATH config --show channels)

### CHECK ###
current_channels=$($CONDA_PATH config --show channels)
if [[ "$current_channels" == *"$expected_channels"* ]]; then
  echo "[SUCCESS] conda-forge is the only channel."
  echo "[INFO] finished!"
  exit 0
fi


### FAILED CASE ###
echo "[FAILDE] expect channels are wrong!"