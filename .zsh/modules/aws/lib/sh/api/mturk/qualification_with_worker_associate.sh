aws_mturk_qualification_with_worker_associate() {
    local qualification_type_id="$1"
    local worker_id="$2"
    shift 2

    cond_log_and_run aws mturk associate-qualification-with-worker --qualification-type-id $qualification_type_id --worker-id $worker_id "$@"
}
