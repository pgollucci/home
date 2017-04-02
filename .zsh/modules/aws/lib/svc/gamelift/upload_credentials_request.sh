aws_gamelift_upload_credentials_request() {
    local build-id="$1"
    shift 1

    cond_log_and_run aws gamelift  --build-id $build_id "@"

}
