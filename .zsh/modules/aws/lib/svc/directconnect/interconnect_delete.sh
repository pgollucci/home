aws_directconnect_interconnect_delete() {
    local interconnect-id="$1"
    shift 1

    cond_log_and_run aws directconnect  --interconnect-id $interconnect_id "@"

}
