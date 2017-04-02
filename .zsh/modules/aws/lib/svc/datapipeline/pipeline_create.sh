aws_datapipeline_pipeline_create() {
    local unique-id="$1"
    local name="$2"
    shift 2

    cond_log_and_run aws datapipeline  --unique-id $unique_id --name $name "@"

}
