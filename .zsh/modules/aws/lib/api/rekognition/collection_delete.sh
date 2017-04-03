aws_rekognition_collection_delete() {
    local collection_id="$1"
    shift 1

    cond_log_and_run aws rekognition delete-collection --collection-id $collection_id "$@"
}
