aws_mturk_qualification_type_get() {
    local qualification-type-id="$1"
    shift 1

    log_and_run aws mturk  --qualification-type-id $qualification_type_id "@"

}
