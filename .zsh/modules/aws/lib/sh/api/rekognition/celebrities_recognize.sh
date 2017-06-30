aws_rekognition_celebrities_recognize() {
    local image="$1"
    shift 1

    cond_log_and_run aws rekognition recognize-celebrities --image $image "$@"
}
