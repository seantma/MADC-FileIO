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
