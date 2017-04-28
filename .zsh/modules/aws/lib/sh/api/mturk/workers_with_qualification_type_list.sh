aws_mturk_workers_with_qualification_type_list() {
    local qualification_type_id="$1"
    shift 1

    log_and_run aws mturk list-workers-with-qualification-type --qualification-type-id $qualification_type_id "$@"
}
