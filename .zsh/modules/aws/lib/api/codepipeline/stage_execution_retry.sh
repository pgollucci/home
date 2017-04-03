aws_codepipeline_stage_execution_retry() {
    local pipeline_name="$1"
    local stage_name="$2"
    local pipeline_execution_id="$3"
    local retry_mode="$4"
    shift 4

    cond_log_and_run aws codepipeline retry-stage-execution --pipeline-name $pipeline_name --stage-name $stage_name --pipeline-execution-id $pipeline_execution_id --retry-mode $retry_mode "$@"
}
