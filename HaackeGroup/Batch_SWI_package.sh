#!/bin/bash
#
# Sean MA, 11/13/2018, 2:17:56 AM
# inspired by fmri Lab - batch_ummap_fm.sh
#
HOME_DIR=${PWD}
NPAR=1

# change to path where md5sum files are located
# excluding PCN & ScannerSoftwareUpdate_NOTE folders
# sorting by fMRI exam_no
# processing the last 135 subjects (as the 1st 50 subjects is done)
cd /nfs/fmri/RAW_nopreprocess
# SUBJ_FILE=$(ls -d {bmh**,hlp**} | grep -v 'PCN' | grep -v 'NOTE' | sort -t_ -k2 | tail -135)
SUBJ_FILE=$(ls -d hlp17umm0154*)  #testing purpose
# SUBJ_FILE=$(ls -d {bmh**,hlp**} | grep -v 'PCN' | grep -v 'NOTE' | sort -t_ -k2)


# masked out `--max-args=1` `--max-procs=$NPAR` for OSX
# cd /Users/tehsheng/Projects/fmri-tools/fMRI-Lab_Blueray_script
echo $SUBJ_FILE | xargs -n1 -P $NPAR ${HOME_DIR}/SWI_package.sh 2>&1 | tee UMMAP_SWI_Dicom_List_$(date +"%Y%m%d").txt
