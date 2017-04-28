aws_gamelift_build_update() {
    local build_id="$1"
    shift 1

    cond_log_and_run aws gamelift update-build --build-id $build_id "$@"
}
