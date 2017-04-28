aws_directconnect_interconnect_loa_describe() {
    local interconnect_id="$1"
    shift 1

    log_and_run aws directconnect describe-interconnect-loa --interconnect-id $interconnect_id "$@"
}
