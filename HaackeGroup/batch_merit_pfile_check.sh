#!/bin/bash
#
# Sean MA, 11/13/2018, 2:17:56 AM
# inspired by fmri Lab - batch_ummap_fm.sh
#
NPAR=1

# change to path where md5sum files are located
# excluding PCN & ScannerSoftwareUpdate_NOTE folders
cd /nfs/fmri/RAW_nopreprocess
SUBJ_FILE=$(ls -d {bmh**,hlp**} | grep -v 'PCN' | grep -v 'NOTE')

# masked out `--max-args=1` `--max-procs=$NPAR` for OSX
# cd /Users/tehsheng/Projects/fmri-tools/fMRI-Lab_Blueray_script
echo $SUBJ_FILE | xargs -n1 -P $NPAR ./SWI_package.sh 2>&1 | tee UMMAP_SWI_Dicom_List.txt