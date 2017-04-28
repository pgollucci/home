aws_swf_workflow_execution_terminate() {
    local domain="$1"
    local workflow_id="$2"
    shift 2

    cond_log_and_run aws swf terminate-workflow-execution --domain $domain --workflow-id $workflow_id "$@"
}
