aws_storagegateway_cached_iscsi_volumes_describe() {
    local volume-arns="$1"
    shift 1

    log_and_run aws storagegateway  --volume-arns $volume_arns "@"

}
