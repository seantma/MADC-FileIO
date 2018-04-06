# Trying to read in multiple consensus agendas and concatenate them into one stack
# 
# Sean Ma, Aug 2017

library(readxl)
library(data.table)

agenda <- read_xlsx('Consensus meeting agenda 8.7.17.xlsx')

agenda_tmp <- fread