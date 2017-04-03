aws_rekognition_collection_create() {
    local collection_id="$1"
    shift 1

    cond_log_and_run aws rekognition create-collection --collection-id $collection_id "$@"
}
