aws_opsworks_service_errors_describe() {
    shift 0

    log_and_run aws opsworks describe-service-errors "$@"
}
