subjIDs=(
# bmh17umm01337_03349
bmh17umm01342_03350
bmh17umm01347_03358
hlp17umm01338_03383
hlp17umm01339_03384
hlp17umm01343_03378
hlp17umm01355_03359
hlp17umm01359_03418
hlp17umm01366_03424
hlp17umm01367_03423
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
  DCM=(find . -type f -name '*.1')

  # log start time
  THEDATE=`date`

  echo
  echo Start $THEDATE
  echo

  # print subject being processed
  echo
  echo "Processing subject: ${SUBJ}"
  echo

  # start recon-all
  # recon-all -all -qcache -parallel -openmp 6 \
  # -i ${DATADIR}/${SUBJ}/${DCM} \
  # -subjid ${SUBJ} \
  # -hippocampal-subfields-T1

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
