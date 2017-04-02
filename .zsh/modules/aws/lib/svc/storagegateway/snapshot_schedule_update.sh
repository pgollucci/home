aws_storagegateway_snapshot_schedule_update() {
    local volume-arn="$1"
    local recurrence-in-hours="$2"
    local start-at="$3"
    shift 3

    cond_log_and_run aws storagegateway  --volume-arn $volume_arn --recurrence-in-hours $recurrence_in_hours --start-at $start_at "@"

}
