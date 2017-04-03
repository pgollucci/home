aws_directconnect_connections_describe() {
    shift 0

    log_and_run aws directconnect describe-connections "$@"
}
