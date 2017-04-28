aws_directconnect_connections_on_interconnect_describe() {
    local interconnect_id="$1"
    shift 1

    log_and_run aws directconnect describe-connections-on-interconnect --interconnect-id $interconnect_id "$@"
}
