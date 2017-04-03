aws_swf_workflow_type_register() {
    local domain="$1"
    local name="$2"
    local workflow_version="$3"
    shift 3

    cond_log_and_run aws swf register-workflow-type --domain $domain --name $name --workflow-version $workflow_version "$@"
}
