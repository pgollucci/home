aws_datapipeline_status_set() {
    local object-ids="$1"
    local status="$2"
    local pipeline-id="$3"
    shift 3

    cond_log_and_run aws datapipeline  --object-ids $object_ids --status $status --pipeline-id $pipeline_id "@"

}
