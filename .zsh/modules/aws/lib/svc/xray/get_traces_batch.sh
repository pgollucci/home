aws_xray_get_traces_batch() {
    local trace-ids="$1"
    shift 1

    log_and_run aws xray  --trace-ids $trace_ids "@"

}
