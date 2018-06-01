#!/bin/bash
#
# Sean MA, 5/31/2018, 3:50:45 PM
# inspired by https://superuser.com/questions/297342/rsync-files-newer-than-1-week
#

# one subject at a time
SUBJ=$1
echo
echo "==== Converting T1 MPGRAGE for - ${SUBJ} ===="
echo

# need to check subject directory to avoid copying wrong place
WORKDIR=/nfs/fmri/RAW_nopreprocess/temp/${SUBJ}

if [ -d "$WORKDIR" ]; then
  cd ${WORKDIR}/dicom

  # dcm2nii conversion
  dcm2nii -g N -p N -d N -x N -r N -c N ${WORKDIR}/dicom/s00003/

else
  echo
  echo "!!! Subject T1 MPRAGE - ${SUBJ} - does NOT exist !!! SKIPPING!!!"
  echo
fi

# create t1mprage_208 folder in /anatomy
mkdir ${WORKDIR}/anatomy/t1mprage_208

# TO DO:  account for differing dcm2nii output .nii names (can there be more possibilities?)
if [ -f ${WORKDIR}/dicom/s00003/s*a1001.nii ]
then
	mv ${WORKDIR}/dicom/s00003/s*a1001.nii ${WORKDIR}/anatomy/t1mprage_208/t1mprage_208.nii
else
	mv ${WORKDIR}/dicom/s00003/s*a1002.nii ${WORKDIR}/anatomy/t1mprage_208/t1mprage_208.nii
fi
