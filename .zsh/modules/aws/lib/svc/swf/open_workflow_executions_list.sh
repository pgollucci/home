aws_swf_open_workflow_executions_list() {
    local start-time-filter="$1"
    local domain="$2"
    shift 2

    log_and_run aws swf  --start-time-filter $start_time_filter --domain $domain "@"

}
