aws_redshift_snapshot_copy_grant_delete() {
    local snapshot_copy_grant_name="$1"
    shift 1

    cond_log_and_run aws redshift delete-snapshot-copy-grant --snapshot-copy-grant-name $snapshot_copy_grant_name "$@"
}
