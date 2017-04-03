aws_datapipeline_pipeline_definition_validate() {
    local pipeline_id="$1"
    local pipeline_objects="$2"
    shift 2

    cond_log_and_run aws datapipeline validate-pipeline-definition --pipeline-id $pipeline_id --pipeline-objects $pipeline_objects "$@"
}
