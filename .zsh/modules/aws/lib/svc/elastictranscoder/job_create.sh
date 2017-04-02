aws_elastictranscoder_job_create() {
    local pipeline-id="$1"
    shift 1

    cond_log_and_run aws elastictranscoder  --pipeline-id $pipeline_id "@"

}
