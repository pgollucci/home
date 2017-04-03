aws_datapipeline_pipeline_activate() {
    local pipeline_id="$1"
    shift 1

    cond_log_and_run aws datapipeline activate-pipeline --pipeline-id $pipeline_id "$@"
}
