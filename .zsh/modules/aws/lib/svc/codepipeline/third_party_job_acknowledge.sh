aws_codepipeline_third_party_job_acknowledge() {
    local nonce="$1"
    local client-token="$2"
    local job-id="$3"
    shift 3

    cond_log_and_run aws codepipeline  --nonce $nonce --client-token $client_token --job-id $job_id "@"

}
