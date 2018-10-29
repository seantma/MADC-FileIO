#!/bin/bash

SUBJ=$1
echo $SUBJ

# define RAW folders
RAW=/nfs/fmri/RAW_nopreprocess
WORK=/nfs/fmri/Analysis/Sean_Working

# make asl folder
mkdir $RAW/$SUBJ/vasc_3dasl

# transform dicoms
cd $RAW/$SUBJ/dicom/s00013
/opt/apps/mricrogl_lx/dcm2niix -f vasc_3dasl .

# move asl files
mv vasc_3dasl.* $RAW/$SUBJ/vasc_3dasl

# setup analysis files
mkdir $WORK/ASL_pilot/$SUBJ
cd mkdir $WORK/ASL_pilot/$SUBJ

cp -p $RAW/$SUBJ/vasc_3dasl/vasc_3dasl.nii .
cp -p $RAW/$SUBJ/anatomy/t1mprage_208/t1mprage_208.nii .

# Done
echo "Finished: " $SUBJ
