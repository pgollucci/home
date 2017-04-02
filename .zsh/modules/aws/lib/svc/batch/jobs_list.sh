aws_batch_jobs_list() {
    local job-queue="$1"
    shift 1

    log_and_run aws batch  --job-queue $job_queue "@"

}
