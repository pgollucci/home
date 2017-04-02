aws_datapipeline_pipeline_definition_validate() {
    local pipeline-objects="$1"
    local pipeline-id="$2"
    shift 2

    cond_log_and_run aws datapipeline  --pipeline-objects $pipeline_objects --pipeline-id $pipeline_id "@"

}
