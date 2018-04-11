## Notes for MADC MRI related

### FIPS issue for Freesurfer/FSLeyes
`strace -o /tmp/,strace.out -fmri_convert sample-001.mgz sample-001.nii.gz`

This is due to RHEL7's more stringent `cryptology` that rejects library calls from softwares like `Freesurfer` that verifies the **license.txt** files. Ben's RHEL6.9 is relieved from that. This is the findings after collaborating with Ben Faunnet. He used `strace` to track the calls from the software.

Similar issue happened with `FSLeyes`. See the `strace` output below.
`strace -f -o /tmp/,eyes.out $FSLDIR/bin/FSLeyes/fsleyes`

```shell
28063 open("/opt/apps/freesurfer-6.0/freesurfer/license.txt", O_RDONLY) = 3
28063 fstat(3, {st_mode=S_IFREG|0644, st_size=59, ...}) = 0
28063 mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fa319883000
28063 read(3, "issc-sysadmin@umich.edu\n23098\n*C"..., 4096) = 59
28063 read(3, "", 4096)                 = 0
28063 open("/proc/sys/crypto/fips_enabled", O_RDONLY) = 4
28063 read(4, "1\n", 31)                = 2
28063 close(4)                          = 0
28063 write(1, "ERROR: crypt() returned null wit"..., 46) = 46
28063 exit_group(1)                     = ?
```
