aws_gamelift_game_session_placement_start() {
    local placement_id="$1"
    local game_session_queue_name="$2"
    local maximum_player_session_count="$3"
    shift 3

    cond_log_and_run aws gamelift start-game-session-placement --placement-id $placement_id --game-session-queue-name $game_session_queue_name --maximum-player-session-count $maximum_player_session_count "$@"
}
