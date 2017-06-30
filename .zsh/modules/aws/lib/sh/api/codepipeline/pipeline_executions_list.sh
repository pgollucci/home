aws_codepipeline_pipeline_executions_list() {
    local pipeline_name="$1"
    shift 1

    log_and_run aws codepipeline list-pipeline-executions --pipeline-name $pipeline_name "$@"
}
