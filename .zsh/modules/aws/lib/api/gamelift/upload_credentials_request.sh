aws_gamelift_upload_credentials_request() {
    local build_id="$1"
    shift 1

    cond_log_and_run aws gamelift request-upload-credentials --build-id $build_id "$@"
}
