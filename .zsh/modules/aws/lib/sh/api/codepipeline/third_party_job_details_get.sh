aws_codepipeline_third_party_job_details_get() {
    local job_id="$1"
    local client_token="$2"
    shift 2

    log_and_run aws codepipeline get-third-party-job-details --job-id $job_id --client-token $client_token "$@"
}
