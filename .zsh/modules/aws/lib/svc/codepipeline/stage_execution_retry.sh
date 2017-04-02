aws_codepipeline_stage_execution_retry() {
    local stage-name="$1"
    local pipeline-name="$2"
    local pipeline-execution-id="$3"
    local retry-mode="$4"
    shift 4

    cond_log_and_run aws codepipeline  --stage-name $stage_name --pipeline-name $pipeline_name --pipeline-execution-id $pipeline_execution_id --retry-mode $retry_mode "@"

}
