aws_mturk_expiration_for_hit_update() {
    local hit_id="$1"
    shift 1

    cond_log_and_run aws mturk update-expiration-for-hit --hit-id $hit_id "$@"
}
