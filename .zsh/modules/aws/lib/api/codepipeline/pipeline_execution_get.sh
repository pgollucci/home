aws_codepipeline_pipeline_execution_get() {
    local pipeline_name="$1"
    local pipeline_execution_id="$2"
    shift 2

    log_and_run aws codepipeline get-pipeline-execution --pipeline-name $pipeline_name --pipeline-execution-id $pipeline_execution_id "$@"
}
