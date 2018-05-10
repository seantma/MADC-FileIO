## Script logic
Might need Make/Ansible/Python to integrate altogether

### TODOs
1. populate Google sheet from /nfs/fmri/RAW_preprocessing folder list and files
2. populate existing scanned modalities, ie. s folders, from /RAW_preprocessing folders & files
3. use MADC scanner sheets to verify 

### MADC
1. Do a diff between local and Singer
2. rsync the diff files back
3. mark the diff files on Google sheet
4. compare Google sheet with local folder
5. Generate a report and email what is missing
6. if possible, cross check /w Consensus (need to scp files from S: drive)

### MERIT
1. Do a diff between local and Singer
2. rsync the diff files back
3. mark the diff files on Excel fMRI Tracker ==> need to investigate how to ssh Z: drive
4. map fMRI sequence number
5. log in correct fMRI ID based on sequence number
6. Generate a report and email what is missing

### Old logic
1. Goto Singer and list files
`ls -td hlp17* | sort  -k2,2gr -t '_'`
2. Match sorted files with Google sheet
3. Copy what is present to local
4. Generate a report on what is missing
5. Need a script to scrape Outlook fmri slots to cross check with Consensus
