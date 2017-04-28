aws_mturk_hit_type_create() {
    local assignment_duration_in_seconds="$1"
    local reward="$2"
    local title="$3"
    local description="$4"
    shift 4

    cond_log_and_run aws mturk create-hit-type --assignment-duration-in-seconds $assignment_duration_in_seconds --reward $reward --title $title --description $description "$@"
}
