aws_mturk_qualification_from_worker_disassociate() {
    local worker_id="$1"
    local qualification_type_id="$2"
    shift 2

    cond_log_and_run aws mturk disassociate-qualification-from-worker --worker-id $worker_id --qualification-type-id $qualification_type_id "$@"
}
