aws_sms_connectors_get() {
    shift 0

    log_and_run aws sms get-connectors "$@"
}
