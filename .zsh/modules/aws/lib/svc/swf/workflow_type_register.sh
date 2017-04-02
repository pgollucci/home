aws_swf_workflow_type_register() {
    local name="$1"
    local domain="$2"
    local workflow-version="$3"
    shift 3

    cond_log_and_run aws swf  --name $name --domain $domain --workflow-version $workflow_version "@"

}
