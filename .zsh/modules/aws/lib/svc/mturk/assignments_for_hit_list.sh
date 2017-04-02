aws_mturk_assignments_for_hit_list() {
    local hit-id="$1"
    shift 1

    log_and_run aws mturk  --hit-id $hit_id "@"

}
