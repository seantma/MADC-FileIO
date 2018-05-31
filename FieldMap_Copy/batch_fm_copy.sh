#!/bin/bash
#
# Sean MA, 5/31/2018, 3:50:45 PM
# inspired by fmri Lab - batch_ummap_fm.sh
#
NPAR=1

cd /nfs/fmri/RAW_nopreprocess
SUBJDIRS=$(ls -d hlp* | grep -v test  | grep -v hlp17umm01494_05012 | sort -t_ -k2)

echo $SUBJDIRS | xargs --max-args=1 --max-procs=$NPAR ~/Projects/MADC-FileIO/FieldMap_Copy/fm_copy.sh
