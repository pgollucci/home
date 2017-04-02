aws_swf_open_workflow_executions_count() {
    local domain="$1"
    local start-time-filter="$2"
    shift 2

    cond_log_and_run aws swf  --domain $domain --start-time-filter $start_time_filter "@"

}
