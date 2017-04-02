aws_datapipeline_pipeline_definition_put() {
    local pipeline-id="$1"
    local pipeline-definition="$2"
    shift 2

    cond_log_and_run aws datapipeline  --pipeline-id $pipeline_id --pipeline-definition $pipeline_definition "@"

}
