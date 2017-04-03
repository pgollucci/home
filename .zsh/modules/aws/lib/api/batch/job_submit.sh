aws_batch_job_submit() {
    local job_name="$1"
    local job_queue="$2"
    local job_definition="$3"
    shift 3

    cond_log_and_run aws batch submit-job --job-name $job_name --job-queue $job_queue --job-definition $job_definition "$@"
}
