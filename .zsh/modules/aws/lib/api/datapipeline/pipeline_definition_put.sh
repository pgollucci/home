aws_datapipeline_pipeline_definition_put() {
    local pipeline_id="$1"
    local pipeline_definition="$2"
    shift 2

    cond_log_and_run aws datapipeline put-pipeline-definition --pipeline-id $pipeline_id --pipeline-definition $pipeline_definition "$@"
}
