aws_mturk_qualification_types_list() {
    local must-be-requestable="$1"
    shift 1

    log_and_run aws mturk  --must-be-requestable $must_be_requestable "@"

}
