aws_mturk_qualification_score_get() {
    local worker-id="$1"
    local qualification-type-id="$2"
    shift 2

    log_and_run aws mturk  --worker-id $worker_id --qualification-type-id $qualification_type_id "@"

}
