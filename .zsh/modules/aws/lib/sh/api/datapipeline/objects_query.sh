aws_datapipeline_objects_query() {
    local pipeline_id="$1"
    local sphere="$2"
    shift 2

    cond_log_and_run aws datapipeline query-objects --pipeline-id $pipeline_id --sphere $sphere "$@"
}
