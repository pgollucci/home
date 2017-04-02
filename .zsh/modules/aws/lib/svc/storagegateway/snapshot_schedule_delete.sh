aws_storagegateway_snapshot_schedule_delete() {
    local volume-arn="$1"
    shift 1

    cond_log_and_run aws storagegateway  --volume-arn $volume_arn "@"

}
