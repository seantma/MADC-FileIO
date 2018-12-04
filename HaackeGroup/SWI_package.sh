#!/bin/bash
#
# Sean Ma
# 12/4/2018

# subject root folder
subjroot=/nfs/fmri/RAW_nopreprocess

# change to current subject folder
SUBJ=$1
cd ${SUBJ}/raw/
echo
echo "==== Working on - ${SUBJ} ===="
echo "=== Path - ${PWD} ==="
echo

# 0. key file to operate on
keyfile=raw_data_cross_reference.dat

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
  target=$(awk '/'${mod}'/ {print $1}' ${keyfile})
  # echo out
  echo "${subjid},${mod},${target}"
  # tar it
done

# change back to root directory
cd ${subjroot}
