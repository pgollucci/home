aws_batch_job_terminate() {
    local job-id="$1"
    local reason="$2"
    shift 2

    cond_log_and_run aws batch  --job-id $job_id --reason $reason "@"

}
