aws_directconnect_lags_describe() {
    shift 0

    log_and_run aws directconnect describe-lags "$@"
}
