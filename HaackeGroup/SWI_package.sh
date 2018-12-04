#!/bin/bash
#
# Sean Ma
# 12/4/2018

# subject root folder
subjroot=/nfs/fmri/RAW_nopreprocess
tarfolder=/nfs/fmri/Haacke_Transfer/Final_Batch_Dec2018

# change to current subject folder
SUBJ=$1
cd ${SUBJ}/raw/
echo
echo "==== Working on - ${SUBJ} ===="
echo "=== Path - ${PWD} ==="
echo

# 0. key file to operate on
keyfile=raw_data_cross_reference.dat

# check if key file exist or not
if [ ! -f ${keyfile} ]; then
    echo "${SUBJ},rawdata file not found!"
    exit 1;
fi

# subject id extraction
subjid=$(awk '/t1/ {print $2}' ${keyfile})

# 1. key modalities to grep
modality=(
t1
t2flair
t2sag
swi_B1
swi_B2
swi_B3
2dfq
)

# 2. grep key modalities from `raw_data_cross_reference.dat`
# print message for NO MATCHES: https://stackoverflow.com/questions/26371440
# grep 'swi_B0' raw_data_cross_reference.dat || echo "no_match" | awk -F" " '{print $1}'
for mod in ${modality[@]}
do
  # use `awk` to directly match pattern and edit
  # https://unix.stackexchange.com/questions/46715
  targetS=$(awk '/'${mod}'/ {print $1}' ${keyfile})

  # echo out
  echo "${SUBJ},${mod},${targetS}"

  # tar it with append; replacing dicom s folders into actual modality
  tar --append -vf ${tarfolder}/${SUBJ}.tar --totals \
  --transform='flags=r;s/'${targetS}'/'${mod}'/' \
  ../dicom/${targetS}/* \
  2>&1 | tee ${tarfolder}/Log_${SUBJ}_$(date +"%Y%m%d").txt
done

# change back to root directory
cd ${subjroot}
