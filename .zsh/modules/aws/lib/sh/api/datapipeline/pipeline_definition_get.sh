aws_datapipeline_pipeline_definition_get() {
    local pipeline_id="$1"
    shift 1

    log_and_run aws datapipeline get-pipeline-definition --pipeline-id $pipeline_id "$@"
}
