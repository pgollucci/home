aws_ds_snapshot_limits_get() {
    local directory-id="$1"
    shift 1

    log_and_run aws ds  --directory-id $directory_id "@"

}
