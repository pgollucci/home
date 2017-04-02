aws_rekognition_faces_search() {
    local face-id="$1"
    local collection-id="$2"
    shift 2

    cond_log_and_run aws rekognition  --face-id $face_id --collection-id $collection_id "@"

}
