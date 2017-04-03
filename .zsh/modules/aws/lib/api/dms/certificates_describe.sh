aws_dms_certificates_describe() {
    shift 0

    log_and_run aws dms describe-certificates "$@"
}
