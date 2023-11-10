#!/bin/bash

set -e

# Download dataset from https://www.kaggle.com/datasets/reevald/geometric-shapes-mathematics 
# and extractr archive to `datasets` folder.
# Run this script.

mkdir ./datasets/geometric-shapes/merged
rsync -a ./datasets/geometric-shapes/train/ ./datasets/geometric-shapes/merged
rsync -a ./datasets/geometric-shapes/test/ ./datasets/geometric-shapes/merged
rsync -a ./datasets/geometric-shapes/val/ ./datasets/geometric-shapes/merged

python dataset_tool.py --width=256 --height=256 --source=./datasets/geometric-shapes/merged/ --dest=./datasets/geometric-shapes/processed