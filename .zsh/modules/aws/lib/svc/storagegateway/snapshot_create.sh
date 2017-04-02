aws_storagegateway_snapshot_create() {
    local snapshot-description="$1"
    local volume-arn="$2"
    shift 2

    cond_log_and_run aws storagegateway  --snapshot-description $snapshot_description --volume-arn $volume_arn "@"

}
