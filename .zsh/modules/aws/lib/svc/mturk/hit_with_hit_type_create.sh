aws_mturk_hit_with_hit_type_create() {
    local hit-type-id="$1"
    local lifetime-in-seconds="$2"
    shift 2

    cond_log_and_run aws mturk  --hit-type-id $hit_type_id --lifetime-in-seconds $lifetime_in_seconds "@"

}
