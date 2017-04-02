aws_batch_job_submit() {
    local job-queue="$1"
    local job-name="$2"
    local job-definition="$3"
    shift 3

    cond_log_and_run aws batch  --job-queue $job_queue --job-name $job_name --job-definition $job_definition "@"

}
