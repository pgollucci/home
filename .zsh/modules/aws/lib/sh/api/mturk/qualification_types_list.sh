aws_mturk_qualification_types_list() {
    local must_be_requestable="$1"
    shift 1

    log_and_run aws mturk list-qualification-types --must-be-requestable $must_be_requestable "$@"
}
