alias snapshots='zfs list -t snapshot'
alias zdf='zfs list'
alias zfsg='zfs get origin,referenced,type,used,atime,checksum,compression,copies,jailed,mountpoint'
alias zls='zfs list -H -t snapshot -o name,origin,type'
alias zfsl='zfs list -r -o name,avail,used,usedbychildren'
