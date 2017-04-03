aws_xray_trace_segments_put() {
    local trace_segment_documents="$1"
    shift 1

    cond_log_and_run aws xray put-trace-segments --trace-segment-documents $trace_segment_documents "$@"
}
