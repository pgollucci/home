aws_codepipeline_job_acknowledge() {
    local job_id="$1"
    local nonce="$2"
    shift 2

    cond_log_and_run aws codepipeline acknowledge-job --job-id $job_id --nonce $nonce "$@"
}
