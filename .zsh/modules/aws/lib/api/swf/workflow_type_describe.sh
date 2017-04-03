aws_swf_workflow_type_describe() {
    local domain="$1"
    local workflow_type="$2"
    shift 2

    log_and_run aws swf describe-workflow-type --domain $domain --workflow-type $workflow_type "$@"
}
