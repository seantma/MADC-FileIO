# 5th batch transfer
# 5/14/2018, 2:33:34 PM

# preparation
hlp17umm01402_*,\
hlp17umm01405_*,\
hlp17umm01220_*,\
hlp17umm01299_*,\
hlp17umm00732_*,\
hlp17umm01412_*,\
hlp17umm01356_*,\
hlp17umm01263_*,\
hlp17umm01403_*,\
hlp17umm01404_*,\

# scripts - main bulk
tar -cvf ../Haacke_Transfer/Haacke_5th_batch.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00009/B1/' \
--transform='flags=r;s/s00010/B2/' \
--transform='flags=r;s/s00011/B3/' \
--transform='flags=r;s/s00012/T2/' \
--transform='flags=r;s/s00014/2D_FQ/' \
./{hlp17umm01405_*,\
hlp17umm01220_*,\
hlp17umm01299_*,\
hlp17umm00732_*,\
hlp17umm01412_*,\
hlp17umm01356_*,\
hlp17umm01404_*}/dicom/s000{03/,04/,09/,10/,11/,12/,14/} 2>&1 \
| tee ../Haacke_Transfer/Haacke_5th_batch_$(date +"%Y%m%d").txt

# 4th batch transfer
# 3/30/2018, 12:22:00 PM

# preparation
hlp17umm01294_*,\
hlp17umm01053_*,\
hlp17umm01174_*,\
hlp17umm01389_*,\
hlp17umm01396_*,\
hlp17umm01260_*,\
hlp17umm01250_*,\
hlp17umm01398_*,\
hlp17umm01401_*,\
hlp17umm01399_*,\

# scripts - main bulk
tar -cvf ../Haacke_Transfer/Haacke_4th_batch.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00009/B1/' \
--transform='flags=r;s/s00010/B2/' \
--transform='flags=r;s/s00011/B3/' \
--transform='flags=r;s/s00012/T2/' \
--transform='flags=r;s/s00014/2D_FQ/' \
./{hlp17umm01294_*,\
hlp17umm01174_*,\
hlp17umm01389_*,\
hlp17umm01396_*,\
hlp17umm01260_*,\
hlp17umm01250_*,\
hlp17umm01398_*,\
hlp17umm01401_*}/dicom/s000{03/,04/,09/,10/,11/,12/,14/} 2>&1 \
| tee ../Haacke_Transfer/Haacke_4th_batch_$(date +"%Y%m%d").txt

# variation 1
tar -rvf ../Haacke_Transfer/Haacke_4th_batch.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00007/B1/' \
--transform='flags=r;s/s00008/B2/' \
--transform='flags=r;s/s00009/B3/' \
--transform='flags=r;s/s00010/T2/' \
--transform='flags=r;s/s00012/2D_FQ/' \
./hlp17umm01053_*/dicom/s000{03/,04/,07/,08/,09/,10/,12/} 2>&1 \
| tee ../Haacke_Transfer/Haacke_4th_batch-1_$(date +"%Y%m%d").txt

# variation 2
tar -rvf ../Haacke_Transfer/Haacke_4th_batch.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00010/B1/' \
--transform='flags=r;s/s00011/B2/' \
--transform='flags=r;s/s00012/B3/' \
--transform='flags=r;s/s00013/T2/' \
--transform='flags=r;s/s00015/2D_FQ/' \
./hlp17umm01399_*/dicom/s000{03/,04/,10/,11/,12/,13/,15/} 2>&1 \
| tee ../Haacke_Transfer/Haacke_4th_batch-2_$(date +"%Y%m%d").txt

# 2D FQ scans retransfer request
# 14/03/2018, 17:13:25
tar -zcvf ../Haacke_Transfer/Haacke_3rd_batch_2DFQ_ReTX.tar --totals \
--transform='flags=r;s/s00014/2D_FQ/' \
./{hlp17umm01384_*,\
hlp17umm01388_*,\
hlp17umm01395_*,\
hlp17umm01372_*}/dicom/s00014/ 2>&1 \
|& tee ../Haacke_Transfer/Logs/Haacke_3rd_batch_2DFQ_ReTX_$(date +"%Y%m%d").txt

# 3rd batch preparation - 03/02/2018
hlp17umm01353
hlp17umm01357
hlp17umm01358
hlp17umm01384
hlp17umm01395
hlp17umm01372
hlp17umm01382
hlp17umm01374
hlp17umm01387
hlp17umm01388

# 3rd batch - main bulk
# NOTE:: - more variation
tar -cvf ../Haacke_Transfer/Haacke_3rd_batch.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00009/B1/' \
--transform='flags=r;s/s00010/B2/' \
--transform='flags=r;s/s00011/B3/' \
--transform='flags=r;s/s00012/T2/' \
./{hlp17umm01353_*,\
hlp17umm01357_*,\
hlp17umm01358_*,\
hlp17umm01384_*,\
hlp17umm01395_*,\
hlp17umm01372_*,\
hlp17umm01388_*}/dicom/s000{03/,04/,09/,10/,11/,12/} 2>&1 \
| tee ../Haacke_Transfer/Logs/Haacke_3rd_batch-1_$(date +"%Y%m%d").txt

# appending 2nd bulk - 2 subjects
tar -rvf ../Haacke_Transfer/Haacke_3rd_batch.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00007/B1/' \
--transform='flags=r;s/s00008/B2/' \
--transform='flags=r;s/s00009/B3/' \
--transform='flags=r;s/s00010/T2/' \
./{hlp17umm01374_*,\
hlp17umm01387_*}/dicom/s000{03/,04/,07/,08/,09/,10/} 2>&1 \
| tee ../Haacke_Transfer/Logs/Haacke_3rd_batch-2_$(date +"%Y%m%d").txt

# appending -r(--append) nonstandared subject files to current tar ball;
# NOTE:: mainly 2D FQ scans
tar -rvf ../Haacke_Transfer/Haacke_3rd_batch.tar --totals \
--transform='flags=r;s/s00014/2D_FQ/' \
./{hlp17umm01353_*,\
hlp17umm01384_*,\
hlp17umm01395_*,\
hlp17umm01372_*}/dicom/s00014/ 2>&1 \
|& tee ../Haacke_Transfer/Logs/Haacke_3rd_batch_add2dFQ-1_$(date +"%Y%m%d").txt

tar -rvf ../Haacke_Transfer/Haacke_3rd_batch.tar --totals \
--transform='flags=r;s/s00012/2D_FQ/' \
./hlp17umm01374_*/dicom/s00012/ \
|& tee ../Haacke_Transfer/Logs/Haacke_3rd_batch_add2dFQ-2_$(date +"%Y%m%d").txt

tar -rvf ../Haacke_Transfer/Haacke_3rd_batch.tar --totals \
--transform='flags=r;s/s00014/2D_FQ/' \
./hlp17umm01388_*/dicom/s00014/ \
|& tee ../Haacke_Transfer/Logs/Haacke_3rd_batch_add2dFQ-3_$(date +"%Y%m%d").txt

tar -rvf ../Haacke_Transfer/Haacke_3rd_batch.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00010/B1/' \
--transform='flags=r;s/s00011/B2/' \
--transform='flags=r;s/s00012/B3/' \
--transform='flags=r;s/s00013/T2/' \
--transform='flags=r;s/s00015/2D_FQ/' \
./hlp17umm01382_*/dicom/s000{03/,04/,10/,11/,12/,13/,15/} \
|& tee ../Haacke_Transfer/Logs/Haacke_3rd_batch_add1382_$(date +"%Y%m%d").txt

# ----------------------------

# 2nd batch preparation
tar -cvf ../Haacke_Transfer/Haacke_2nd_batch.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00009/B1/' \
--transform='flags=r;s/s00010/B2/' \
--transform='flags=r;s/s00011/B3/' \
--transform='flags=r;s/s00012/T2/' \
--transform='flags=r;s/s00014/2D_FQ/' \
./{hlp17umm00773_*,\
hlp17umm01346_*,\
hlp17umm01364_*,\
hlp17umm01360_*,\
hlp17umm01362_*,\
hlp17umm01378_*,\
hlp17umm01368_*,\
hlp17umm01379_*,\
hlp17umm01380_*}/dicom/s000{03/,04/,09/,10/,11/,12/,14/} 2>&1 \
| tee ../Haacke_Transfer/Haacke_2nd_batch_$(date +"%Y%m%d").txt

# appending -r(--append) nonstandared subject files to current tar ball;
tar -rvf ../Haacke_Transfer/Haacke_2nd_batch.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00007/B1/' \
--transform='flags=r;s/s00008/B2/' \
--transform='flags=r;s/s00009/B3/' \
--transform='flags=r;s/s00010/T2/' \
--transform='flags=r;s/s00013/2D_FQ/' \
./hlp17umm01341_*/dicom/s000{03/,04/,07/,08/,09/,10/,13/} \
|& tee ../Haacke_Transfer/Haacke_2nd_batch_add1341_$(date +"%Y%m%d").txt

# prepping for Haacke's group with different sets of DICOMS and renaming them separately thru `transform`
# https://www.gnu.org/software/tar/manual/html_section/tar_52.html#transform
# - using s000{03/} instead of {s*3} to avoid {s00013}
# - can't use zip format if need to append files later
tar -cvf ../Haacke_1st_TestCase.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00007/B1/' \
--transform='flags=r;s/s00008/B2/' \
--transform='flags=r;s/s00009/B3/' \
--transform='flags=r;s/s00010/T2/' \
--transform='flags=r;s/s00012/2D_FQ/' \
./{bmh17umm01337_*,\
bmh17umm01342_*,\
bmh17umm01347_*,\
hlp17umm01355_*,\
hlp17umm01343_*,\
hlp17umm01338_*,\
hlp17umm01339_*,\
hlp17umm01366_*}/dicom/s000{03/,04/,07/,08/,09/,10/,12/} 2>&1 \
| tee ../Haacke_1st_TestCase_$(date +"%Y%m%d").txt

# appending -r(--append) nonstandared subject files to current tar ball;
# - works only with uncompressed tar ball
tar -rvf ../Haacke_1st_TestCase.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00007/B1/' \
--transform='flags=r;s/s00008/B2/' \
--transform='flags=r;s/s00009/B3/' \
--transform='flags=r;s/s00010/T2/' \
--transform='flags=r;s/s00011/2D_FQ/' \
./hlp17umm01359_03418/dicom/s000{03/,04/,07/,08/,09/,10/,11/} \
|& tee ../Haacke_1st_TestCase_add1359_$(date +"%Y%m%d").txt

tar -rvf ../Haacke_1st_TestCase.tar --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
--transform='flags=r;s/s00008/B1/' \
--transform='flags=r;s/s00009/B2/' \
--transform='flags=r;s/s00010/B3/' \
--transform='flags=r;s/s00011/T2/' \
--transform='flags=r;s/s00013/2D_FQ/' \
./hlp17umm01367_03423/dicom/s000{03/,04/,08/,09/,10/,11/,13/} \
|& tee ../Haacke_1st_TestCase_add1367_$(date +"%Y%m%d").txt
