#!/bin/bash
#
# Finding any constructed vasc_3dasl/
# Sean Ma
# Oct 2018

for i in $(ls -d hlp*); do
  T=$(find $i/ -name vasc_3dasl -type d | wc -w);
  echo $i,$T;
done | sort -k4 > ummap_asl_status.csv
