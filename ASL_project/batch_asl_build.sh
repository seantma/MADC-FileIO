#!/bin/bash

NPAR=4

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

# using `xargs` and piping variable elements to it
# inspired by https://unix.stackexchange.com/questions/471461/echo-list-array-to-xargs
printf '%s\n' "${SUBJDIRS[@]}" | xargs -n1 --max-procs=$NPAR /home/tehsheng/Projects/MADC-FileIO/ASL_project/asl_build.sh

# --max-args=1

# [tehsheng@madcbrain ASL_project]$ sh ./batch_asl_build.sh
# hlp17umm01220_03783
# hlp17umm01243_04201
# hlp17umm01263_03874
# hlp17umm01276_03938
# mkdir: cannot create directory ‘/nfs/fmri/RAW_nopreprocess/hlp17umm01220_03783/vasc_3dasl’: File exists
# Chris Rorden's dcm2niiX version v1.0.20170724 GCC4.4.7 (64-bit Linux)
# Found 80 DICOM image(s)
# Chris Rorden's dcm2niiX version v1.0.20170724 GCC4.4.7 (64-bit Linux)
# Chris Rorden's dcm2niiX version v1.0.20170724 GCC4.4.7 (64-bit Linux)
# Chris Rorden's dcm2niiX version v1.0.20170724 GCC4.4.7 (64-bit Linux)
# Convert 80 DICOM as ./vasc_3dasl (128x128x40x2)
# Conversion required 0.185075 seconds (0.030000 for core code).
# mkdir: cannot create directory ‘/nfs/fmri/Analysis/Sean_Working/ASL_pilot/hlp17umm01220_03783’: File exists
# Finished:  hlp17umm01220_03783
# hlp17umm01389_03696
# Chris Rorden's dcm2niiX version v1.0.20170724 GCC4.4.7 (64-bit Linux)
# Found 80 DICOM image(s)
# Found 80 DICOM image(s)
# Convert 80 DICOM as ./vasc_3dasl (128x128x40x2)
# Found 80 DICOM image(s)
# Conversion required 1.516256 seconds (0.030000 for core code).
# Convert 80 DICOM as ./vasc_3dasl (128x128x40x2)
# Conversion required 1.638649 seconds (0.030000 for core code).
# Convert 80 DICOM as ./vasc_3dasl (128x128x40x2)
# Conversion required 1.715488 seconds (0.030000 for core code).
# Found 80 DICOM image(s)
# Finished:  hlp17umm01243_04201
# hlp17umm01446_04476
# Chris Rorden's dcm2niiX version v1.0.20170724 GCC4.4.7 (64-bit Linux)
# Finished:  hlp17umm01276_03938
# hlp17umm01447_04475
# Finished:  hlp17umm01263_03874
# hlp17umm01458_04524
# Convert 80 DICOM as ./vasc_3dasl (128x128x40x2)
# Conversion required 1.984445 seconds (0.040000 for core code).
# Chris Rorden's dcm2niiX version v1.0.20170724 GCC4.4.7 (64-bit Linux)
# Chris Rorden's dcm2niiX version v1.0.20170724 GCC4.4.7 (64-bit Linux)
# Finished:  hlp17umm01389_03696
# hlp17umm01462_04510
# Chris Rorden's dcm2niiX version v1.0.20170724 GCC4.4.7 (64-bit Linux)
# Found 80 DICOM image(s)
# Found 80 DICOM image(s)
# Convert 80 DICOM as ./vasc_3dasl (128x128x40x2)
# Conversion required 1.181185 seconds (0.040000 for core code).
# Found 80 DICOM image(s)
# Convert 80 DICOM as ./vasc_3dasl (128x128x40x2)
# Conversion required 1.408790 seconds (0.030000 for core code).
# Convert 80 DICOM as ./vasc_3dasl (128x128x40x2)
# Conversion required 1.497022 seconds (0.040000 for core code).
# Finished:  hlp17umm01447_04475
# hlp17umm01487_04682
# Chris Rorden's dcm2niiX version v1.0.20170724 GCC4.4.7 (64-bit Linux)
# Found 80 DICOM image(s)
# Finished:  hlp17umm01446_04476
# Finished:  hlp17umm01458_04524
# Convert 80 DICOM as ./vasc_3dasl (128x128x40x2)
# Conversion required 1.580687 seconds (0.040000 for core code).
# Finished:  hlp17umm01462_04510
# Found 80 DICOM image(s)
# Convert 80 DICOM as ./vasc_3dasl (128x128x40x2)
# Conversion required 2.797105 seconds (0.040000 for core code).
# Finished:  hlp17umm01487_04682
