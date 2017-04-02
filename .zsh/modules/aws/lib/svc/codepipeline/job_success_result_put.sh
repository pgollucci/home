aws_codepipeline_job_success_result_put() {
    local job-id="$1"
    shift 1

    cond_log_and_run aws codepipeline  --job-id $job_id "@"

}
