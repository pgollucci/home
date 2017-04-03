aws_iot_logging_options_get() {
    shift 0

    log_and_run aws iot get-logging-options "$@"
}
