aws_elasticbeanstalk_storage_location_create() {
    shift 0

    cond_log_and_run aws elasticbeanstalk create-storage-location "$@"
}
