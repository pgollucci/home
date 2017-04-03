aws_datapipeline_pipeline_deactivate() {
    local pipeline_id="$1"
    shift 1

    cond_log_and_run aws datapipeline deactivate-pipeline --pipeline-id $pipeline_id "$@"
}
