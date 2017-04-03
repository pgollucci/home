aws_codepipeline_stage_transition_enable() {
    local pipeline_name="$1"
    local stage_name="$2"
    local transition_type="$3"
    shift 3

    cond_log_and_run aws codepipeline enable-stage-transition --pipeline-name $pipeline_name --stage-name $stage_name --transition-type $transition_type "$@"
}
