aws_codepipeline_action_revision_put() {
    local pipeline-name="$1"
    local stage-name="$2"
    local action-revision="$3"
    local action-name="$4"
    shift 4

    cond_log_and_run aws codepipeline  --pipeline-name $pipeline_name --stage-name $stage_name --action-revision $action_revision --action-name $action_name "@"

}
