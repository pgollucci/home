aws_mturk_qualification_type_delete() {
    local qualification-type-id="$1"
    shift 1

    cond_log_and_run aws mturk  --qualification-type-id $qualification_type_id "@"

}
