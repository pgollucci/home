aws_iot_endpoint_describe() {
    shift 0

    log_and_run aws iot describe-endpoint "$@"
}
