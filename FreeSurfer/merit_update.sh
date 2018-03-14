#!/bin/bash
# setting up environment
export SUBJECTS_DIR=/mnt/psych-bhampstelab/VA_MCI_Rehab/Sean_Working/FS6results

recon-all -make all \
  -parallel -openmp 2 \
  -subjid $1
