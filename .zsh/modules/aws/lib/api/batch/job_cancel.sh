aws_batch_job_cancel() {
    local job_id="$1"
    local reason="$2"
    shift 2

    cond_log_and_run aws batch cancel-job --job-id $job_id --reason $reason "$@"
}
