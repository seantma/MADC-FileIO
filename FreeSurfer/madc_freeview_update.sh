#!/bin/bash
#
# Sean Ma, March 2018
# usage: sh ./madc_freeview_update.sh subject_folder

freeview -v ./${1}/mri/wm.mgz ./${1}/mri/brainmask.mgz ./${1}/mri/T1.mgz -f \
./${1}/surf/lh.white:edgecolor=magenta:edgethickness=1 \
./${1}/surf/rh.white:edgecolor=magenta:edgethickness=1 \
./${1}/surf/lh.pial:edgecolor=cyan:edgethickness=1  \
./${1}/surf/rh.pial:edgecolor=cyan:edgethickness=1 \
./${1}/surf/surf_orig/lh.white:edgecolor=yellow:edgethickness=1 \
./${1}/surf/surf_orig/rh.white:edgecolor=yellow:edgethickness=1 \
./${1}/surf/surf_orig/lh.pial:edgecolor=red:edgethickness=1 \
./${1}/surf/surf_orig/rh.pial:edgecolor=red:edgethickness=1
