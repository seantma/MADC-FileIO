#!/bin/bash

NPAR=4

cd /export/archive/trailer
SUBJDIRS=$(ls -d hlp* | grep -v test  | grep -v hlp17umm01494_05012 | sort -t_ -k2)

echo $SUBJDIRS | xargs --max-args=1 --max-procs=$NPAR /export/archive/trailer/fm_ummap.sh
