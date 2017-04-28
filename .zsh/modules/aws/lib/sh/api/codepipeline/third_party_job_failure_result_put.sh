aws_codepipeline_third_party_job_failure_result_put() {
    local job_id="$1"
    local client_token="$2"
    local failure_details="$3"
    shift 3

    cond_log_and_run aws codepipeline put-third-party-job-failure-result --job-id $job_id --client-token $client_token --failure-details $failure_details "$@"
}
