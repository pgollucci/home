aws_rekognition_collection_create() {
    local collection-id="$1"
    shift 1

    cond_log_and_run aws rekognition  --collection-id $collection_id "@"

}
