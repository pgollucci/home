aws_datapipeline_runs_list() {
    local pipeline-id="$1"
    shift 1

    log_and_run aws datapipeline  --pipeline-id $pipeline_id "@"

}
