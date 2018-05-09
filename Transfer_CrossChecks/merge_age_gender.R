# Purpose: Merging Age/Gender for Haacke group
#
# Sean Ma, March 2018
#

# ---------------------
# merging age/gender info for Haacke group
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
cmd_ls <- "cd /nfs/fmri/RAW_nopreprocess; ls -td *17umm*"
madc_mri <- run.remote(cmd=cmd_ls, remote=remote, verbose = TRUE)

# extract directory data from list structure to df; rename column; add server status
madc_mri_df <- as.data.frame(madc_mri$cmd.out); colnames(madc_mri_df) <- "Server_MRI_ID"
madc_mri_df$Server_status <- "Yes"

# separate fmri sequence number from ID
madc_mri_df <- madc_mri_df %>%
  separate(Server_MRI_ID, c("Server_ID", "Server_Seq")) %>%
  arrange(desc(Server_Seq)) %>%
  mutate(UDS_ID = str_extract(Server_ID, "[0-9]+$"))

# getting /dicom folder creation date for scan date!!
cmd_dicomDate <- "cd /nfs/fmri/RAW_nopreprocess; find *17umm*/ -maxdepth 2 -type d -name \'s00003\' -printf \'%p %Tm-%Td-%TY\n\'"
madc_mri_dicomDate <- run.remote(cmd=cmd_dicomDate, remote=remote, verbose = TRUE)
madc_mri_dicomDate_df <- as.data.frame(madc_mri_dicomDate$cmd.out); colnames(madc_mri_dicomDate_df) <- "Subject_dicom"

# separate date from subject ID
madc_mri_dicomDate_df <- madc_mri_dicomDate_df %>%
  separate(Subject_dicom, c("Subject_dicom", "Date"), sep = " ") %>%
  separate(Subject_dicom, c("Subject", "dicom", "s_folder"), sep = "/") %>%
  separate(Subject, c("Server_ID", "Server_Seq"), sep = "_") %>%
  arrange(desc(Server_Seq))

# comparing differences in subject IDs /w anti_join
anti_join(madc_mri_df, madc_mri_dicomDate_df)

# left_join Server_ID with folders that have /raw folder
madc_mri_df <- madc_mri_df %>%
  left_join(madc_mri_dicomDate_df, by = c("Server_ID", "Server_Seq"))

write.csv(madc_mri_df, "Transfer_CrossChecks/MADC_MRI_List_with_Dates.csv")

# ---------------------
# finding difference between Server and Google sheet MRI IDs
library(daff)

patch <- diff_data(madc_mri, gs_track)
render_diff(patch)

# ---------------------
# NEXT write back to Google Sheet !!