## Notes for MADC MRI related

### FIPS issue for Freesurfer/FSLeyes
`strace -o /tmp/,strace.out -fmri_convert sample-001.mgz sample-001.nii.gz`

This is due to RHEL7's more stringent `cryptology` that rejects library calls from softwares like `Freesurfer` that verifies the **license.txt** files. Ben's RHEL6.9 is relieved from that. This is the findings after collaborating with Ben Faunnet. He used `strace` to track the calls from the software.
