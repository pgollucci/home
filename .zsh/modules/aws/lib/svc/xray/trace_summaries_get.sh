aws_xray_trace_summaries_get() {
    local start-time="$1"
    local end-time="$2"
    shift 2

    log_and_run aws xray  --start-time $start_time --end-time $end_time "@"

}
