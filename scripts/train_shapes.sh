#!/bin/bash

python train.py --outdir=./output \
--data=datasets/geometric-shapes/processed \
--cond=1 \
--t_start_kimg=1000  \
--t_end_kimg=4000 \
--cfg=auto \
--metrics=fid50k_full,kid50k_full



