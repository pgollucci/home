aws_batch_job_terminate() {
    local job_id="$1"
    local reason="$2"
    shift 2

    cond_log_and_run aws batch terminate-job --job-id $job_id --reason $reason "$@"
}
