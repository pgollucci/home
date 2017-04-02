aws_datapipeline_objects_query() {
    local pipeline-id="$1"
    local sphere="$2"
    shift 2

    cond_log_and_run aws datapipeline  --pipeline-id $pipeline_id --sphere $sphere "@"

}
