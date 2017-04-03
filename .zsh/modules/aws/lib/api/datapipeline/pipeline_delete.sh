aws_datapipeline_pipeline_delete() {
    local pipeline_id="$1"
    shift 1

    cond_log_and_run aws datapipeline delete-pipeline --pipeline-id $pipeline_id "$@"
}
