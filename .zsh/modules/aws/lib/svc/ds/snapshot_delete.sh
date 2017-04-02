aws_ds_snapshot_delete() {
    local snapshot-id="$1"
    shift 1

    cond_log_and_run aws ds  --snapshot-id $snapshot_id "@"

}
