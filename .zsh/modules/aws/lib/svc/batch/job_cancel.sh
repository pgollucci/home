aws_batch_job_cancel() {
    local reason="$1"
    local job-id="$2"
    shift 2

    cond_log_and_run aws batch  --reason $reason --job-id $job_id "@"

}
