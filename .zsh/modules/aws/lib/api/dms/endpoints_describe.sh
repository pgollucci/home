aws_dms_endpoints_describe() {
    shift 0

    log_and_run aws dms describe-endpoints "$@"
}
