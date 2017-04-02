aws_swf_workflow_type_deprecate() {
    local domain="$1"
    local workflow-type="$2"
    shift 2

    cond_log_and_run aws swf  --domain $domain --workflow-type $workflow_type "@"

}
