aws_gamelift_player_sessions_describe() {
    shift 0

    log_and_run aws gamelift describe-player-sessions "$@"
}
