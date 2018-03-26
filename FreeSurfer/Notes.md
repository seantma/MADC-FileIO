## Freesurfer notes

Needed a place to capture Freesurfer command lines knowledge and wiki locations

### Command lines
1. From Rachel for updating edits (from her old lab /w Emily)
  `recon-all -autorecon2-cp -autorecon3 -subjid 600018902293 -sd /net/pepper/Penn/Freesurfer/ -norm2-b 20 -norm2-n 5`
2. Added some TODO in `madc_fs.sh` script to glean and produce master log for `recon-all.log` results.
3.

### Good wiki sources
1. `Recon-all`: https://surfer.nmr.mgh.harvard.edu/fswiki/recon-all
2. White matter edits: https://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/WhiteMatterEdits_freeview
3. Correcting pial surfaces: http://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/PialEdits_freeview
4. Update after edits: https://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/TroubleshootingData
5. `recon-all` options: https://surfer.nmr.mgh.harvard.edu/fswiki/ReconAllTableStableV6.0
6. `persistent edits` options: https://surfer.nmr.mgh.harvard.edu/fswiki/Edits

### References
1. UT Dallas Freesurfer User Guide added
    - has both general and in-depth knowledge captured
    - addressed how to error check for `recon-all` outputs
    - still didn't address on how to incorporate previous results with new edits in `freeview`
    - the closest would be backing up `/mri/wm.mgz` `/mri/brainmask/mgz` and `/surf/*` for later comparison usage.
2. Merkel 2015 using custom group-specific template to estimate hippocampus
    - ANTs was used from normalization
    - a group specific template was first created.
    - hippocampus was then traced on the group template
    - individual hippocampus was then reversed transformed from the group template hippocampus ROI
    - **need to investigate the actual detailed script!!**
3. Similar discussion on custom template was also discussed in `fmriprep`: https://github.com/poldracklab/fmriprep/issues/330
4. Although `Freesurfer` had a wiki page on `SurfaceRegAndTemplates`, it was not clear on the mapping procedures and how it could be generalizable to other use cases (compared with Merkel 2015): https://surfer.nmr.mgh.harvard.edu/fswiki/SurfaceRegAndTemplates
