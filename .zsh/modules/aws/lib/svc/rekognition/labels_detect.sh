aws_rekognition_labels_detect() {
    local image="$1"
    shift 1

    cond_log_and_run aws rekognition  --image $image "@"

}
