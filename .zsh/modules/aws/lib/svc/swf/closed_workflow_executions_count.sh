aws_swf_closed_workflow_executions_count() {
    local domain="$1"
    shift 1

    cond_log_and_run aws swf  --domain $domain "@"

}
