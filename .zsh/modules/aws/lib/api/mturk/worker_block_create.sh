aws_mturk_worker_block_create() {
    local worker_id="$1"
    local reason="$2"
    shift 2

    cond_log_and_run aws mturk create-worker-block --worker-id $worker_id --reason $reason "$@"
}
