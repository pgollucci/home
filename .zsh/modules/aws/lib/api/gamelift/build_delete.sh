aws_gamelift_build_delete() {
    local build_id="$1"
    shift 1

    cond_log_and_run aws gamelift delete-build --build-id $build_id "$@"
}
