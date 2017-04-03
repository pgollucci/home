aws_mturk_qualification_score_get() {
    local qualification_type_id="$1"
    local worker_id="$2"
    shift 2

    log_and_run aws mturk get-qualification-score --qualification-type-id $qualification_type_id --worker-id $worker_id "$@"
}
