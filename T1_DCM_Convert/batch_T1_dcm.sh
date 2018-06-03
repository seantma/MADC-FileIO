#!/bin/bash
#
# Sean MA, 5/31/2018, 3:50:45 PM
# inspired by fmri Lab - batch_ummap_fm.sh
#
# define number of processors
NPAR=1

# entering working directory
cd /nfs/fmri/RAW_nopreprocess/temp

# find numbers of files in /dicom/s00003
# find ./{hlp**,bmh**}/dicom/s00003 -type d -exec sh -c 'echo "$(ls {} | wc -l)" {}' \; > t1_dicom_list.txt

# exclude subject folders that have wrong T1 MPRAGE slices: 208
SUBJDIRS=$(ls -d {hlp**,bmh**} | grep -v hlp17umm01339_03384 | grep -v hlp17umm01405_03782 | grep -v hlp17umm01511_04164 | sort -t_ -k2)

# run shell script thru xargs
echo $SUBJDIRS | xargs --max-args=1 --max-procs=$NPAR ~/Projects/MADC-FileIO/T1_DCM_Convert/T1_dcm.sh
