aws_mturk_hi_ts_for_qualification_type_list() {
    local qualification_type_id="$1"
    shift 1

    log_and_run aws mturk list-hi-ts-for-qualification-type --qualification-type-id $qualification_type_id "$@"
}
