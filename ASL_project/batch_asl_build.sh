#!/bin/bash

NPAR=1

cd /nfs/fmri/RAW_nopreprocess

SUBJDIRS=(
hlp17umm01220_03783
hlp17umm01243_04201
hlp17umm01263_03874
hlp17umm01276_03938
hlp17umm01389_03696
hlp17umm01446_04476
hlp17umm01447_04475
hlp17umm01458_04524
hlp17umm01462_04510
hlp17umm01487_04682
)

echo $SUBJDIRS | xargs  /home/tehsheng/Projects/MADC-FileIO/ASL_project/asl_build.sh

# --max-args=1
# -n1 --max-procs=$NPAR
