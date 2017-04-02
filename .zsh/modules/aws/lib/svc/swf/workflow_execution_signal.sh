aws_swf_workflow_execution_signal() {
    local domain="$1"
    local workflow-id="$2"
    local signal-name="$3"
    shift 3

    cond_log_and_run aws swf  --domain $domain --workflow-id $workflow_id --signal-name $signal_name "@"

}
