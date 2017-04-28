aws_swf_workflow_type_deprecate() {
    local domain="$1"
    local workflow_type="$2"
    shift 2

    cond_log_and_run aws swf deprecate-workflow-type --domain $domain --workflow-type $workflow_type "$@"
}
