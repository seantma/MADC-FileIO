#!/bin/bash
# Purpose: To fix Freesurfer edits done on brainmask
# Source: https://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/TroubleshootingData
# Author: Sean Ma, Mar 2018

# setting up environment
export SUBJECTS_DIR=/mnt/psych-bhampstelab/MADC/Rachael_project

# this didn't work for both bmask and wm edits
# recon-all -make all \
#   -parallel -openmp 2 \
#   -subjid $1

echo
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "  This script fixes brainmask edits only for subject ${1} !! "
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo

# fixing only brainmask edits command
recon-all -autorecon-pial \
  -parallel -openmp 2
  -subjid ${1}
