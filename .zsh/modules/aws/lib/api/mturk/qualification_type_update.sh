aws_mturk_qualification_type_update() {
    local qualification_type_id="$1"
    shift 1

    cond_log_and_run aws mturk update-qualification-type --qualification-type-id $qualification_type_id "$@"
}
