aws_storagegateway_volume_delete() {
    local volume_arn="$1"
    shift 1

    cond_log_and_run aws storagegateway delete-volume --volume-arn $volume_arn "$@"
}
