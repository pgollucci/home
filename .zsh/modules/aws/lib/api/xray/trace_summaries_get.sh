aws_xray_trace_summaries_get() {
    local start_time="$1"
    local end_time="$2"
    shift 2

    log_and_run aws xray get-trace-summaries --start-time $start_time --end-time $end_time "$@"
}
