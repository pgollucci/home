aws_datapipeline_status_set() {
    local pipeline_id="$1"
    local object_ids="$2"
    local status="$3"
    shift 3

    cond_log_and_run aws datapipeline set-status --pipeline-id $pipeline_id --object-ids $object_ids --status $status "$@"
}
