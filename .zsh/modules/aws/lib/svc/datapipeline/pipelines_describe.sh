aws_datapipeline_pipelines_describe() {
    local pipeline-ids="$1"
    shift 1

    log_and_run aws datapipeline  --pipeline-ids $pipeline_ids "@"

}
