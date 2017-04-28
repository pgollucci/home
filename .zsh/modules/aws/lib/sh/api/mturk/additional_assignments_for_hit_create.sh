aws_mturk_additional_assignments_for_hit_create() {
    local hit_id="$1"
    shift 1

    cond_log_and_run aws mturk create-additional-assignments-for-hit --hit-id $hit_id "$@"
}
