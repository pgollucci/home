aws_opsworks_permissions_describe() {
    shift 0

    log_and_run aws opsworks describe-permissions "$@"
}
