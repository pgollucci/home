aws_xray_trace_segments_put() {
    local trace-segment-documents="$1"
    shift 1

    cond_log_and_run aws xray  --trace-segment-documents $trace_segment_documents "@"

}
