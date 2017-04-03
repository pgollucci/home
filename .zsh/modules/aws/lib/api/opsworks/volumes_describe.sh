aws_opsworks_volumes_describe() {
    shift 0

    log_and_run aws opsworks describe-volumes "$@"
}
