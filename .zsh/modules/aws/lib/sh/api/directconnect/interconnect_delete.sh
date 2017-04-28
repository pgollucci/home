aws_directconnect_interconnect_delete() {
    local interconnect_id="$1"
    shift 1

    cond_log_and_run aws directconnect delete-interconnect --interconnect-id $interconnect_id "$@"
}
