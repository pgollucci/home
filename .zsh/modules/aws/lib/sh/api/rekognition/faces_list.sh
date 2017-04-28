aws_rekognition_faces_list() {
    local collection_id="$1"
    shift 1

    log_and_run aws rekognition list-faces --collection-id $collection_id "$@"
}
