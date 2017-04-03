aws_codepipeline_job_failure_result_put() {
    local job_id="$1"
    local failure_details="$2"
    shift 2

    cond_log_and_run aws codepipeline put-job-failure-result --job-id $job_id --failure-details $failure_details "$@"
}
