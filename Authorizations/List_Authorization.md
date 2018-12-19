### Log for MADC MRI authorization requests

#### Shell script to prepare authorization package
```shell
tar -zcvf ../Authorization/Auth_$(date +"%Y%m%d").tgz --totals \
--transform='flags=r;s/s00003/T1/' \
--transform='flags=r;s/s00004/T2_FLAIR/' \
./{hlp17umm01459_*,\
hlp17umm01482_*}/dicom/s000{03/,04/} 2>&1 \
| tee ../Authorization/Logs/Auth_$(date +"%Y%m%d")_Log.txt
```
#### 1219-2018
UDS1360_03482 - Sarah Shair requested again 12/17

#### 1113-2018
UDS1476_05633 - Oliver/Tanisha requested 11/12
UDS1477_05634 - Oliver/Tanisha requested 11/12

#### 1105-2018
UDS1271_04040 - Rachael requested 10/31
UDS1556_05503 - Tanisha requested 10/17

#### 1017-2018
UDS1360_03482 - Tanisha requested 10/16

#### 0719-2018
UDS1494_05012 - Ari requested 7/13
UDS1396_03659 - Ari requested 7/13

#### 0627-2018
UDS1388_03660 - Rachael requested 6/14

#### 0606-2018
UDS1387_03659 - Rachael requested 5/30

#### 0514-2018
UDS1459_04651 - Jaci requested
UDS1482_04642 - Renee requested

#### 0406-2018
UDS1066_04229
UDS1151_04163
UDS1412_03837
UDS1413_04046
UDS833_04068

#### 0309-2018
UDS1408_03905
