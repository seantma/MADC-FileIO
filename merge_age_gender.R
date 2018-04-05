# Purpose: Merging Age/Gender for Haacke group
#
# Sean Ma, March 2018
#

# ---------------------
library(tidyverse)

setwd("~/Box Sync/MADC/MADC_Imaging/Haacke_Data_Transfer")

age_sex <- readxl::read_xlsx('MRI_Age_Gender.xlsx', col_types = c("text", "numeric", "text"))
fmri <- readxl::read_xlsx('fMRI_Tracker.xlsx')

fmri <- left_join(fmri, age_sex, by = c("UDS_ID" = "Subject ID"))

write.csv(fmri, "age_sex_fmri.csv")


#----------------------
# accessing Google sheet and comparing between server and sheet
library(googlesheets)
library(dplyr)
library(tidyr)

# registering google sheet
# gs_mri <- gs_url("https://docs.google.com/spreadsheets/d/118F0gthxb8wymIRm114lLIX0K36Ic1I161764JGyb-M")
gs_mri <- gs_title("fMRI_Tracker")

# doing some operations on it
gs_track <- gs_mri %>%
  gs_read(ws = "Tracking") %>%
  drop_na(No) %>%
  arrange(desc(fMRI_ID)) %>%
  select(fMRI_ID)

# ---------------------
# accessing MADC server to get /RAW_nonpreprocess info
library(ssh.utils)
remote <- "tehsheng@madcbrain.umms.med.umich.edu"
cmd1 <- "cd /nfs/fmri/RAW_nopreprocess; ls -td *17umm*"
madc_mri <- run.remote(cmd=cmd1, remote=remote, verbose = TRUE)

# extract directory data from list structure to df; rename column; add server status
madc_mri <- as.data.frame(madc_mri$cmd.out); colnames(madc_mri) <- "Server_MRI_ID"
madc_mri$Server_status <- "Yes"

# separate fmri sequence number from ID
madc_mri <- madc_mri %>%
  separate(Server_MRI_ID, c("Server_ID", "Server_Seq")) %>%
  arrange(desc(Server_ID)) %>%
  select(Server_ID)

# ---------------------
# finding difference between Server and Google sheet MRI IDs
library(daff)

patch <- diff_data(madc_mri, gs_track)
render_diff(patch)
