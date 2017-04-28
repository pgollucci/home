aws_codepipeline_action_revision_put() {
    local pipeline_name="$1"
    local stage_name="$2"
    local action_name="$3"
    local action_revision="$4"
    shift 4

    cond_log_and_run aws codepipeline put-action-revision --pipeline-name $pipeline_name --stage-name $stage_name --action-name $action_name --action-revision $action_revision "$@"
}
