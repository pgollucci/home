aws_gamelift_game_session_placement_start() {
    local maximum-player-session-count="$1"
    local placement-id="$2"
    local game-session-queue-name="$3"
    shift 3

    cond_log_and_run aws gamelift  --maximum-player-session-count $maximum_player_session_count --placement-id $placement_id --game-session-queue-name $game_session_queue_name "@"

}
