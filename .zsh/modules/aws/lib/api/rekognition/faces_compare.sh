aws_rekognition_faces_compare() {
    local source_image="$1"
    local target_image="$2"
    shift 2

    cond_log_and_run aws rekognition compare-faces --source-image $source_image --target-image $target_image "$@"
}
