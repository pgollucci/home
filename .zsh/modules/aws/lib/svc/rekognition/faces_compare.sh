aws_rekognition_faces_compare() {
    local source-image="$1"
    local target-image="$2"
    shift 2

    cond_log_and_run aws rekognition  --source-image $source_image --target-image $target_image "@"

}
