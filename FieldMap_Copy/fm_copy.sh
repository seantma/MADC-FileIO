#!/bin/bash
#
# Sean MA, 5/31/2018, 3:50:45 PM
# inspired by https://superuser.com/questions/297342/rsync-files-newer-than-1-week
#

# one subject at a time
SUBJ=$1
echo
echo "==== Backing up subject - ${SUBJ} ===="
echo

# need to change to subject directory to avoid copying wrong place
cd /nfs/fmri/RAW_nopreprocess/temp/${SUBJ}

# rsync archive mode, /w relative to preserve folder structure, progress
rsync -avh --stats --relative -D0P \
--files-from=<(ssh -t fmrilab@singer.engin.umich.edu "cd /export/archive/trailer/${SUBJ}; find ./func/ -mtime -7 -print0") \
--log-file=./Logs_rsync_FieldMap/rsync_${SUBJ}_FieldMap_$(date +"%m%d_%Y_%Hh%Mm%Ss").log \
fmrilab@singer.engin.umich.edu:/export/archive/trailer/${SUBJ}/ .
