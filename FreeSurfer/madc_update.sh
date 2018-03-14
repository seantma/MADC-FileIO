#!/bin/bash
# setting up environment
export SUBJECTS_DIR=/mnt/psych-bhampstelab/MADC/Rachael_project

recon-all -make all \
  -parallel -openmp 2 \
  -subjid $1
