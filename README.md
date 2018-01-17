## Script logic
Might need Make/Ansible/Python to integrate altogether

1. Do a diff between local and Singer
2. rsync the diff files back
3. mark the diff files on Google sheet
4. compare Google sheet with local folder
5. Generate a report and email what is missing
6. if possible, cross check /w Consensus (need to scp files from S: drive)

### Old logic
1. Goto Singer and list files
`ls -td hlp17* | sort  -k2,2gr -t '_'`
2. Match sorted files with Google sheet
3. Copy what is present to local
4. Generate a report on what is missing
5. Need a script to scrape Outlook fmri slots to cross check with Consensus
