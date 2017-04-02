aws_xray_trace_graph_get() {
    local trace-ids="$1"
    shift 1

    log_and_run aws xray  --trace-ids $trace_ids "@"

}
