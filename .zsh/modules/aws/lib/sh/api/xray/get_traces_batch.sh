aws_xray_get_traces_batch() {
    local trace_ids="$1"
    shift 1

    log_and_run aws xray batch-get-traces --trace-ids $trace_ids "$@"
}
