#!/bin/bash
# Purpose: To fix Freesurfer edits done on white matter
# Source: https://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/TroubleshootingData
# Author: Sean Ma, Mar 2018

# setting up environment
export SUBJECTS_DIR=/mnt/psych-bhampstelab/MADC/Rachael_project

echo
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
echo "  This script fixes white matter edits only for subject ${1} !! "
echo "* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
echo

# fixing only white matter edits command
recon-all -autorecon2-wm -autorecon3 \
  -parallel -openmp 2 \
  -subjid ${1}
