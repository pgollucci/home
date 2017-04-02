aws_storagegateway_snapshot_schedule_describe() {
    local volume-arn="$1"
    shift 1

    log_and_run aws storagegateway  --volume-arn $volume_arn "@"

}
