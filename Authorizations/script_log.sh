## MADC MRI Authorization logs

# 4/6/2018, 3:07:56 PM
tar -zcvf ../Authorization/Auth_$(date +"%Y%m%d").tgz --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
./{hlp17umm01066_*,\
hlp17umm01412_*,\
hlp17umm00833_*,\
hlp17umm01413_*,\
hlp17umm01151_*}/dicom/s000{03/,04/} 2>&1 \
| tee ../Authorization/Authorization_$(date +"%Y%m%d").txt
