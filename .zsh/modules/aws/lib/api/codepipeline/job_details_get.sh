aws_codepipeline_job_details_get() {
    local job_id="$1"
    shift 1

    log_and_run aws codepipeline get-job-details --job-id $job_id "$@"
}
