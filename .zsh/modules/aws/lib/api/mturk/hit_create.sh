aws_mturk_hit_create() {
    local lifetime_in_seconds="$1"
    local assignment_duration_in_seconds="$2"
    local reward="$3"
    local title="$4"
    local description="$5"
    shift 5

    cond_log_and_run aws mturk create-hit --lifetime-in-seconds $lifetime_in_seconds --assignment-duration-in-seconds $assignment_duration_in_seconds --reward $reward --title $title --description $description "$@"
}
