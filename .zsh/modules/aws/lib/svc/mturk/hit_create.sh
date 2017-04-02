aws_mturk_hit_create() {
    local lifetime-in-seconds="$1"
    local reward="$2"
    local assignment-duration-in-seconds="$3"
    local title="$4"
    local description="$5"
    shift 5

    cond_log_and_run aws mturk  --lifetime-in-seconds $lifetime_in_seconds --reward $reward --assignment-duration-in-seconds $assignment_duration_in_seconds --title $title --description $description "@"

}
