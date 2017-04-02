aws_codepipeline_pipeline_execution_get() {
    local pipeline-name="$1"
    local pipeline-execution-id="$2"
    shift 2

    log_and_run aws codepipeline  --pipeline-name $pipeline_name --pipeline-execution-id $pipeline_execution_id "@"

}
