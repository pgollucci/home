aws_mturk_hit_type_of_hit_update() {
    local hit_id="$1"
    local hit_type_id="$2"
    shift 2

    cond_log_and_run aws mturk update-hit-type-of-hit --hit-id $hit_id --hit-type-id $hit_type_id "$@"
}
