# @Author: Sean Ma <tehsheng>
# @Date:   2018-01-10T11:55:03-05:00
# @Email:  tehsheng@umich.edu
# @Filename: madc_fs.sh
# @Last modified by:   tehsheng
# @Last modified time: 2018-01-12T11:46:03-05:00

# Script to batch process T1 images for FREESURFER 6
#
# usage: sh ./madc_hippo_only.sh 2>&1 | tee MADC_FS6_Hippo_only_log_$(date +"%m%d_%Y").txt


# TODO::
# 1. add in a flag file - `1-Orig-recon-all-DONE.flag` for later
#    edit update script or report script to check upon on
# 2. create a master `done.report.txt` to log last 4 lines in `recon-all.log`
# Started at Sat Mar 24 00:16:13 EDT 2018
# Ended   at Sat Mar 24 07:34:53 EDT 2018
# #@#%# recon-all-run-time-hours 7.311
# recon-all -s bmh14mci00003 finished without error at Sat Mar 24 07:34:53 EDT 2018
# 3. automatically backup wm.mgz, brainmask.mgz & /surf for later on usage


subjIDs=(
# Original T1s
# # bmh17umm01337_03349
# bmh17umm01342_03350
# bmh17umm01347_03358
# hlp17umm01338_03383
hlp17umm01339_03384         # had errors on 1st recon-all
# hlp17umm01343_03378
# hlp17umm01355_03359
# hlp17umm01359_03418
# hlp17umm01366_03424
# hlp17umm01367_03423
# STAGE processed T1
# STAGE_bmh17umm01337_03349
# STAGE_bmh17umm01342_03350
# STAGE_bmh17umm01347_03358
# STAGE_hlp17umm01338_03383
# STAGE_hlp17umm01339_03384
# STAGE_hlp17umm01343_03378
# STAGE_hlp17umm01355_03359
# STAGE_hlp17umm01359_03418   # stuck at mris_fix_topology - #@# Fix Topology rh Mon Jan 15 06:30:04 EST 2018
# STAGE_hlp17umm01366_03424
# STAGE_hlp17umm01367_03423
)

# setup data directory
DATADIR=/mnt/psych-bhampstelab/MADC/FSinput
cd ${DATADIR}

# setting up environment
export SUBJECTS_DIR=/mnt/psych-bhampstelab/MADC/FSresults

# calling Freesurfer master scripts in /ftools
source ~/Projects/fmri-tools/FreeSurfer_master/fs6_reconall.sh

# done!
echo
echo "Completed !!!"
echo
