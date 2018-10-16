#!/bin/bash

SUBJ=$1
echo $SUBJ
cd /export/archive/trailer/$SUBJ/func

FILELIST=$(find ./ -type f -name t*run*nii)

for FILE in $FILELIST
do
	TASK=$(echo $FILE | cut -d/ -f2)
	if [ "${TASK}" == "resting" ]
	then
		TERT=16.42
		FMDIR="/export/archive/trailer/${SUBJ}/func/fieldmaps/FM_resting/dicom"
	elif [ "${TASK}" == "restingabcd" ]
	then
		TERT=48.24
		FMDIR="/export/archive/trailer/${SUBJ}/func/fieldmaps/FM_restingABCD/dicom"
	fi

	fieldmap_prep.sh $FMDIR >> fieldmap_correct.log
	
	cd `dirname $FILE`
	fieldmap_correct.sh -f `basename $FILELIST` -d $FMDIR -t $TERT >> fieldmap_correct.log
	cd /export/archive/trailer/$SUBJ/func
done


