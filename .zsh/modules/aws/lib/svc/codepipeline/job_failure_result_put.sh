aws_codepipeline_job_failure_result_put() {
    local failure-details="$1"
    local job-id="$2"
    shift 2

    cond_log_and_run aws codepipeline  --failure-details $failure_details --job-id $job_id "@"

}
