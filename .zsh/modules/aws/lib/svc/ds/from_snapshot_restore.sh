aws_ds_from_snapshot_restore() {
    local snapshot-id="$1"
    shift 1

    cond_log_and_run aws ds  --snapshot-id $snapshot_id "@"

}
