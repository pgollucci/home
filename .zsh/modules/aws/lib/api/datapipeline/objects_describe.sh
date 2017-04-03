aws_datapipeline_objects_describe() {
    local pipeline_id="$1"
    local object_ids="$2"
    shift 2

    log_and_run aws datapipeline describe-objects --pipeline-id $pipeline_id --object-ids $object_ids "$@"
}
