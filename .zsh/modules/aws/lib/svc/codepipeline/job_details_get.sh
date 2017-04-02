aws_codepipeline_job_details_get() {
    local job-id="$1"
    shift 1

    log_and_run aws codepipeline  --job-id $job_id "@"

}
