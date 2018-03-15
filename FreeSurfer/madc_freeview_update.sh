#!/bin/bash
freeview -v ./${1}/mri/wm.mgz ./${1}/mri/brainmask.mgz ./${1}/mri/T1.mgz -f \
./surf/lh.white:edgecolor=magenta:edgethickness=1 \
./surf/rh.white:edgecolor=magenta:edgethickness=1 \
./surf/lh.pial:edgecolor=cyan:edgethickness=1  \
./surf/rh.pial:edgecolor=cyan:edgethickness=1 \
./surf/surf_orig/lh.white:edgecolor=yellow:edgethickness=1 \
./surf/surf_orig/rh.white:edgecolor=yellow:edgethickness=1 \
./surf/surf_orig/lh.pial:edgecolor=red:edgethickness=1 \
./surf/surf_orig/rh.pial:edgecolor=red:edgethickness=1
