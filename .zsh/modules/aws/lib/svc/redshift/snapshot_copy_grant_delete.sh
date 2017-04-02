aws_redshift_snapshot_copy_grant_delete() {
    local snapshot-copy-grant-name="$1"
    shift 1

    cond_log_and_run aws redshift  --snapshot-copy-grant-name $snapshot_copy_grant_name "@"

}
