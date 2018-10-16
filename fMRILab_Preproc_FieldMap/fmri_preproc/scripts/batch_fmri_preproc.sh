#!/bin/bash

SUBJLIST=$*

PDIR=$(pwd)

#. /export/home/fmrilab/krisanne_test/new_proc/fmri_preproc/quickaddpaths
. /export/subjects/birb_proc/fmri_preproc/quickaddpaths

cd /export/subjects/birb_proc

for SUBJ in $SUBJLIST
do
  cd $SUBJ
   fmri_preproc.py master_process_out.json > log 2>&1 
  #cd $PDIR
  cd /export/subjects/birb_proc
done

