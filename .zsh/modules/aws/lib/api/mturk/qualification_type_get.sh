aws_mturk_qualification_type_get() {
    local qualification_type_id="$1"
    shift 1

    log_and_run aws mturk get-qualification-type --qualification-type-id $qualification_type_id "$@"
}
