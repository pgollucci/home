aws_gamelift_build_describe() {
    local build_id="$1"
    shift 1

    log_and_run aws gamelift describe-build --build-id $build_id "$@"
}
