aws_swf_closed_workflow_executions_list() {
    local domain="$1"
    shift 1

    log_and_run aws swf  --domain $domain "@"

}
