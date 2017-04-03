aws_dms_connections_describe() {
    shift 0

    log_and_run aws dms describe-connections "$@"
}
