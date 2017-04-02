aws_gamelift_build_describe() {
    local build-id="$1"
    shift 1

    log_and_run aws gamelift  --build-id $build_id "@"

}
