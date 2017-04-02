aws_storagegateway_volume_initiators_list() {
    local volume-arn="$1"
    shift 1

    log_and_run aws storagegateway  --volume-arn $volume_arn "@"

}
