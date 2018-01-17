# @Author: Sean Ma <tehsheng>
# @Date:   2018-01-10T11:55:03-05:00
# @Email:  tehsheng@umich.edu
# @Filename: madc_fs.sh
# @Last modified by:   tehsheng
# @Last modified time: 2018-01-12T11:46:03-05:00

# Script to batch process T1 images for FREESURFER 6
#
# usage: sh ./madc_fs.sh

subjIDs=(
# Original T1s
# # bmh17umm01337_03349
# bmh17umm01342_03350
# bmh17umm01347_03358
# hlp17umm01338_03383
# hlp17umm01339_03384
# hlp17umm01343_03378
# hlp17umm01355_03359
# hlp17umm01359_03418
# hlp17umm01366_03424
# hlp17umm01367_03423
# STAGE processed T1
STAGE_bmh17umm01337_03349
STAGE_bmh17umm01342_03350
STAGE_bmh17umm01347_03358
STAGE_hlp17umm01338_03383
STAGE_hlp17umm01339_03384
STAGE_hlp17umm01343_03378
STAGE_hlp17umm01355_03359
STAGE_hlp17umm01359_03418   # stuck at mris_fix_topology - #@# Fix Topology rh Mon Jan 15 06:30:04 EST 2018
STAGE_hlp17umm01366_03424
STAGE_hlp17umm01367_03423
)

# setup data directory
DATADIR=/mnt/psych-bhampstelab/MADC/FSinput
cd ${DATADIR}

# setting up environment
export SUBJECTS_DIR=/mnt/psych-bhampstelab/MADC/FSresults

# looping over subjects
for SUBJ in ${subjIDs[@]}
do
  cd ${DATADIR}/${SUBJ}
  # Dicoms for original T1s
  # DCM=`find . -type f -name '*.1'`
  # Dicoms for STAGE processed T1s
  DCM=`find . -type f -name '[0-9]*-1.dcm'`

  # log start time
  THEDATE=`date`

  echo
  echo ======================================
  echo Start $THEDATE

  # print subject being processed
  echo
  echo "Processing subject: ${SUBJ}"
  echo

  # start recon-all
  recon-all -all -qcache -parallel -openmp 6 \
  -i ${DATADIR}/${SUBJ}/${DCM} \
  -subjid ${SUBJ} \
  -hippocampal-subfields-T1

  echo ${DATADIR}/${SUBJ}/${DCM}

  # log end time
  THEDATE=`date`

  echo
  echo End $THEDATE
  echo

done

echo
echo "Completed !!!"
echo
