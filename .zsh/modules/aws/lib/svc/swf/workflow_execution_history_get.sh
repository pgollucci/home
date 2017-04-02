aws_swf_workflow_execution_history_get() {
    local execution="$1"
    local domain="$2"
    shift 2

    log_and_run aws swf  --execution $execution --domain $domain "@"

}
