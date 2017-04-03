aws_gamelift_game_session_queues_describe() {
    shift 0

    log_and_run aws gamelift describe-game-session-queues "$@"
}
