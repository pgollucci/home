aws_rekognition_faces_search() {
    local collection_id="$1"
    local face_id="$2"
    shift 2

    cond_log_and_run aws rekognition search-faces --collection-id $collection_id --face-id $face_id "$@"
}
