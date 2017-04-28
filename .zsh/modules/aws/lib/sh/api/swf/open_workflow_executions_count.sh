aws_swf_open_workflow_executions_count() {
    local domain="$1"
    local start_time_filter="$2"
    shift 2

    cond_log_and_run aws swf count-open-workflow-executions --domain $domain --start-time-filter $start_time_filter "$@"
}
