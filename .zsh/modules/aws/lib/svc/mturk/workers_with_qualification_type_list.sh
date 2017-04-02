aws_mturk_workers_with_qualification_type_list() {
    local qualification-type-id="$1"
    shift 1

    log_and_run aws mturk  --qualification-type-id $qualification_type_id "@"

}
