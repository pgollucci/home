aws_batch_job_queue_delete() {
    local job_queue="$1"
    shift 1

    cond_log_and_run aws batch delete-job-queue --job-queue $job_queue "$@"
}
