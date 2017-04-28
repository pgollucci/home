aws_redshift_snapshot_copy_grant_create() {
    local snapshot_copy_grant_name="$1"
    shift 1

    cond_log_and_run aws redshift create-snapshot-copy-grant --snapshot-copy-grant-name $snapshot_copy_grant_name "$@"
}
