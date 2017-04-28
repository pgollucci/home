aws_storagegateway_snapshot_schedule_describe() {
    local volume_arn="$1"
    shift 1

    log_and_run aws storagegateway describe-snapshot-schedule --volume-arn $volume_arn "$@"
}
