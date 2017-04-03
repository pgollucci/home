aws_storagegateway_volumes_list() {
    shift 0

    log_and_run aws storagegateway list-volumes "$@"
}
