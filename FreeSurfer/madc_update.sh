#!/bin/bash
# setting up environment
export SUBJECTS_DIR=/mnt/psych-bhampstelab/MADC/Rachael_project

recon-all -make all -subjid $1
