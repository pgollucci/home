aws_gamelift_game_session_placement_stop() {
    local placement_id="$1"
    shift 1

    cond_log_and_run aws gamelift stop-game-session-placement --placement-id $placement_id "$@"
}
