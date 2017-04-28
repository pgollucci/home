aws_rekognition_faces_detect() {
    local image="$1"
    shift 1

    cond_log_and_run aws rekognition detect-faces --image $image "$@"
}
