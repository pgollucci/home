aws_codepipeline_third_party_job_success_result_put() {
    local job_id="$1"
    local client_token="$2"
    shift 2

    cond_log_and_run aws codepipeline put-third-party-job-success-result --job-id $job_id --client-token $client_token "$@"
}
