aws_mturk_worker_block_delete() {
    local worker-id="$1"
    shift 1

    cond_log_and_run aws mturk  --worker-id $worker_id "@"

}
