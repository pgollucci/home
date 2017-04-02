aws_gamelift_game_session_create() {
    local maximum-player-session-count="$1"
    shift 1

    cond_log_and_run aws gamelift  --maximum-player-session-count $maximum_player_session_count "@"

}
