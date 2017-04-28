aws_datapipeline_pipelines_describe() {
    local pipeline_ids="$1"
    shift 1

    log_and_run aws datapipeline describe-pipelines --pipeline-ids $pipeline_ids "$@"
}
