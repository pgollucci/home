aws_codepipeline_job_success_result_put() {
    local job_id="$1"
    shift 1

    cond_log_and_run aws codepipeline put-job-success-result --job-id $job_id "$@"
}
