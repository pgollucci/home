aws_batch_job_definition_deregister() {
    local job-definition="$1"
    shift 1

    cond_log_and_run aws batch  --job-definition $job_definition "@"

}
