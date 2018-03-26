## Freesurfer notes

Needed a place to capture Freesurfer command lines knowledge and wiki locations

### Command lines
1. From Rachel for updating edits (from her old lab /w Emily)
  `recon-all -autorecon2-cp -autorecon3 -subjid 600018902293 -sd /net/pepper/Penn/Freesurfer/ -norm2-b 20 -norm2-n 5`

### Good wiki sources
1. `Recon-all`: https://surfer.nmr.mgh.harvard.edu/fswiki/recon-all
2. White matter edits: https://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/WhiteMatterEdits_freeview
3. Correcting pial surfaces: http://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/PialEdits_freeview
4. Update after edits: https://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/TroubleshootingData
5. `recon-all` options: https://surfer.nmr.mgh.harvard.edu/fswiki/ReconAllTableStableV6.0
6. `persistent edits` options: https://surfer.nmr.mgh.harvard.edu/fswiki/Edits

### UT Dallas Freesurfer User Guide added
- has both general and in-depth knowledge captured
- addressed how to error check for `recon-all` outputs
- still didn't address on how to incorporate previous results with new edits in `freeview`
- the closest would be backing up `/mri/wm.mgz` `/mri/brainmask/mgz` and `/surf/*` for later comparison usage.
