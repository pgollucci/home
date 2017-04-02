aws_datapipeline_pipeline_activate() {
    local pipeline-id="$1"
    shift 1

    cond_log_and_run aws datapipeline  --pipeline-id $pipeline_id "@"

}
