aws_storagegateway_snapshot_schedule_update() {
    local volume_arn="$1"
    local start_at="$2"
    local recurrence_in_hours="$3"
    shift 3

    cond_log_and_run aws storagegateway update-snapshot-schedule --volume-arn $volume_arn --start-at $start_at --recurrence-in-hours $recurrence_in_hours "$@"
}
