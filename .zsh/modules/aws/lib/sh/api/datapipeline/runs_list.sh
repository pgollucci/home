aws_datapipeline_runs_list() {
    local pipeline_id="$1"
    shift 1

    log_and_run aws datapipeline list-runs --pipeline-id $pipeline_id "$@"
}
