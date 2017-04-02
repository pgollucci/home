aws_mturk_worker_block_create() {
    local reason="$1"
    local worker-id="$2"
    shift 2

    cond_log_and_run aws mturk  --reason $reason --worker-id $worker_id "@"

}
