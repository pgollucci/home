aws_gamelift_game_session_log_get() {
    local game-session-id="$1"
    local save-as="$2"
    shift 2

    log_and_run aws gamelift  --game-session-id $game_session_id --save-as $save_as "@"

}
