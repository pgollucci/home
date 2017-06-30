aws_rekognition_celebrity_info_get() {
    local id="$1"
    shift 1

    log_and_run aws rekognition get-celebrity-info --id $id "$@"
}
