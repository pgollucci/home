aws_datapipeline_pipeline_create() {
    local name="$1"
    local unique_id="$2"
    shift 2

    cond_log_and_run aws datapipeline create-pipeline --name $name --unique-id $unique_id "$@"
}
