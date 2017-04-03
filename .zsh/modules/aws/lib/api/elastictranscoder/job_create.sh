aws_elastictranscoder_job_create() {
    local pipeline_id="$1"
    shift 1

    cond_log_and_run aws elastictranscoder create-job --pipeline-id $pipeline_id "$@"
}
