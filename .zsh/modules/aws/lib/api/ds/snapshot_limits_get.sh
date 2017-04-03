aws_ds_snapshot_limits_get() {
    local directory_id="$1"
    shift 1

    log_and_run aws ds get-snapshot-limits --directory-id $directory_id "$@"
}
