aws_ds_from_snapshot_restore() {
    local snapshot_id="$1"
    shift 1

    cond_log_and_run aws ds restore-from-snapshot --snapshot-id $snapshot_id "$@"
}
