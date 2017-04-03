aws_ds_snapshot_create() {
    local directory_id="$1"
    shift 1

    cond_log_and_run aws ds create-snapshot --directory-id $directory_id "$@"
}
