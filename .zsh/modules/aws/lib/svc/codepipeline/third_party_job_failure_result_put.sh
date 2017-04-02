aws_codepipeline_third_party_job_failure_result_put() {
    local job-id="$1"
    local client-token="$2"
    local failure-details="$3"
    shift 3

    cond_log_and_run aws codepipeline  --job-id $job_id --client-token $client_token --failure-details $failure_details "@"

}
