aws_gamelift_game_sessions_search() {
    shift 0

    cond_log_and_run aws gamelift search-game-sessions "$@"
}
