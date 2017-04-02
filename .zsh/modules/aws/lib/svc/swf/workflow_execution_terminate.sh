aws_swf_workflow_execution_terminate() {
    local workflow-id="$1"
    local domain="$2"
    shift 2

    cond_log_and_run aws swf  --workflow-id $workflow_id --domain $domain "@"

}
