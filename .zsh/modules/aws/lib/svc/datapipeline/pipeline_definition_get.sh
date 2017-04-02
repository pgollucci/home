aws_datapipeline_pipeline_definition_get() {
    local pipeline-id="$1"
    shift 1

    log_and_run aws datapipeline  --pipeline-id $pipeline_id "@"

}
