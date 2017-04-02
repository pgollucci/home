aws_codepipeline_stage_transition_enable() {
    local stage-name="$1"
    local pipeline-name="$2"
    local transition-type="$3"
    shift 3

    cond_log_and_run aws codepipeline  --stage-name $stage_name --pipeline-name $pipeline_name --transition-type $transition_type "@"

}
