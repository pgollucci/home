aws_batch_jobs_list() {
    local job_queue="$1"
    shift 1

    log_and_run aws batch list-jobs --job-queue $job_queue "$@"
}
