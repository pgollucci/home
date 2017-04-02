aws_gamelift_player_session_create() {
    local game-session-id="$1"
    local player-id="$2"
    shift 2

    cond_log_and_run aws gamelift  --game-session-id $game_session_id --player-id $player_id "@"

}
