aws_gamelift_player_sessions_create() {
    local game-session-id="$1"
    local player-ids="$2"
    shift 2

    cond_log_and_run aws gamelift  --game-session-id $game_session_id --player-ids $player_ids "@"

}
