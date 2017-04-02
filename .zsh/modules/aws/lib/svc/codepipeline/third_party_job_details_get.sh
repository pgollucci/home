aws_codepipeline_third_party_job_details_get() {
    local client-token="$1"
    local job-id="$2"
    shift 2

    log_and_run aws codepipeline  --client-token $client_token --job-id $job_id "@"

}
