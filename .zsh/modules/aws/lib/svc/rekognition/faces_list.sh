aws_rekognition_faces_list() {
    local collection-id="$1"
    shift 1

    log_and_run aws rekognition  --collection-id $collection_id "@"

}
