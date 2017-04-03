aws_batch_job_queue_update() {
    local job_queue="$1"
    shift 1

    cond_log_and_run aws batch update-job-queue --job-queue $job_queue "$@"
}
