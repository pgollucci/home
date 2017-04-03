aws_mturk_hit_delete() {
    local hit_id="$1"
    shift 1

    cond_log_and_run aws mturk delete-hit --hit-id $hit_id "$@"
}
