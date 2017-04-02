aws_gamelift_build_delete() {
    local build-id="$1"
    shift 1

    cond_log_and_run aws gamelift  --build-id $build_id "@"

}
