aws_gamelift_game_session_placement_describe() {
    local placement-id="$1"
    shift 1

    log_and_run aws gamelift  --placement-id $placement_id "@"

}
