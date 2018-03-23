#!/bin/bash
# Purpose: To fix Freesurfer edits done on brainmask
# Source: https://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/TroubleshootingData
# Author: Sean Ma, Mar 2018

# setting up environment
export SUBJECTS_DIR=/mnt/psych-bhampstelab/MADC/Rachael_project

echo
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo "  This script fixes both bm/wm edits for subject ${1} !! "
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
echo

# fixing both brain mask and white matter edits command
recon-all -all \
  -parallel -openmp 4 \
  -subjid ${1}
