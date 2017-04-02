aws_mturk_hit_type_create() {
    local assignment-duration-in-seconds="$1"
    local reward="$2"
    local description="$3"
    local title="$4"
    shift 4

    cond_log_and_run aws mturk  --assignment-duration-in-seconds $assignment_duration_in_seconds --reward $reward --description $description --title $title "@"

}
