aws_batch_job_definition_deregister() {
    local job_definition="$1"
    shift 1

    cond_log_and_run aws batch deregister-job-definition --job-definition $job_definition "$@"
}
