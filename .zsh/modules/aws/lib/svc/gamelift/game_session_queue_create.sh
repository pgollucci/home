aws_gamelift_game_session_queue_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws gamelift  --name $name "@"

}
