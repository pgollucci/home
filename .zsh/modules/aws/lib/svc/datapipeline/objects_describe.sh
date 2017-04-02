aws_datapipeline_objects_describe() {
    local pipeline-id="$1"
    local object-ids="$2"
    shift 2

    log_and_run aws datapipeline  --pipeline-id $pipeline_id --object-ids $object_ids "@"

}
