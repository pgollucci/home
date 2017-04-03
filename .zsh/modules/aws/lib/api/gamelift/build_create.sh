aws_gamelift_build_create() {
    shift 0

    cond_log_and_run aws gamelift create-build "$@"
}
