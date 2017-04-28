aws_codepipeline_custom_action_type_delete() {
    local category="$1"
    local provider="$2"
    local action_version="$3"
    shift 3

    cond_log_and_run aws codepipeline delete-custom-action-type --category $category --provider $provider --action-version $action_version "$@"
}
