aws_rekognition_faces_index() {
    local collection-id="$1"
    local image="$2"
    shift 2

    cond_log_and_run aws rekognition  --collection-id $collection_id --image $image "@"

}
