aws_gamelift_build_update() {
    local build-id="$1"
    shift 1

    cond_log_and_run aws gamelift  --build-id $build_id "@"

}
