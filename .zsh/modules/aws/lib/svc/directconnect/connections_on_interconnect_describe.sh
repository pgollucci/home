aws_directconnect_connections_on_interconnect_describe() {
    local interconnect-id="$1"
    shift 1

    log_and_run aws directconnect  --interconnect-id $interconnect_id "@"

}
