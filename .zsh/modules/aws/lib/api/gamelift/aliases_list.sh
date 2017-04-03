aws_gamelift_aliases_list() {
    shift 0

    log_and_run aws gamelift list-aliases "$@"
}
