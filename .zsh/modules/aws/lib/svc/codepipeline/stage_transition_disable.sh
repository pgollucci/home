aws_codepipeline_stage_transition_disable() {
    local reason="$1"
    local pipeline-name="$2"
    local transition-type="$3"
    local stage-name="$4"
    shift 4

    cond_log_and_run aws codepipeline  --reason $reason --pipeline-name $pipeline_name --transition-type $transition_type --stage-name $stage_name "@"

}
