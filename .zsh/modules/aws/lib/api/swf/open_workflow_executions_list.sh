aws_swf_open_workflow_executions_list() {
    local domain="$1"
    local start_time_filter="$2"
    shift 2

    log_and_run aws swf list-open-workflow-executions --domain $domain --start-time-filter $start_time_filter "$@"
}
