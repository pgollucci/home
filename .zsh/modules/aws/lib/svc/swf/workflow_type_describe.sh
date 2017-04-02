aws_swf_workflow_type_describe() {
    local domain="$1"
    local workflow-type="$2"
    shift 2

    log_and_run aws swf  --domain $domain --workflow-type $workflow_type "@"

}
