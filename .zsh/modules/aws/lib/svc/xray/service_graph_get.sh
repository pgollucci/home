aws_xray_service_graph_get() {
    local end-time="$1"
    local start-time="$2"
    shift 2

    log_and_run aws xray  --end-time $end_time --start-time $start_time "@"

}
