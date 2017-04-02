aws_rekognition_faces_delete() {
    local collection-id="$1"
    local face-ids="$2"
    shift 2

    cond_log_and_run aws rekognition  --collection-id $collection_id --face-ids $face_ids "@"

}
