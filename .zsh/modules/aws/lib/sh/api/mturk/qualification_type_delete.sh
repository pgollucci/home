aws_mturk_qualification_type_delete() {
    local qualification_type_id="$1"
    shift 1

    cond_log_and_run aws mturk delete-qualification-type --qualification-type-id $qualification_type_id "$@"
}
