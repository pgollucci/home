aws_gamelift_game_session_update() {
    local game_session_id="$1"
    shift 1

    cond_log_and_run aws gamelift update-game-session --game-session-id $game_session_id "$@"
}
