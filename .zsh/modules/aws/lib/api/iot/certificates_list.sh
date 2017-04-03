aws_iot_certificates_list() {
    shift 0

    log_and_run aws iot list-certificates "$@"
}
