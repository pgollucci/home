aws_batch_job_queue_update() {
    local job-queue="$1"
    shift 1

    cond_log_and_run aws batch  --job-queue $job_queue "@"

}
