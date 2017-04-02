aws_swf_workflow_execution_start() {
    local workflow-id="$1"
    local domain="$2"
    local workflow-type="$3"
    shift 3

    cond_log_and_run aws swf  --workflow-id $workflow_id --domain $domain --workflow-type $workflow_type "@"

}
