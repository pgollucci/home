aws_directconnect_loa_describe() {
    local connection_id="$1"
    shift 1

    log_and_run aws directconnect describe-loa --connection-id $connection_id "$@"
}
