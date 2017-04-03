aws_xray_trace_graph_get() {
    local trace_ids="$1"
    shift 1

    log_and_run aws xray get-trace-graph --trace-ids $trace_ids "$@"
}
