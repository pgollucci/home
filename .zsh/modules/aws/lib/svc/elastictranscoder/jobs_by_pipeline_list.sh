aws_elastictranscoder_jobs_by_pipeline_list() {
    local pipeline-id="$1"
    shift 1

    log_and_run aws elastictranscoder  --pipeline-id $pipeline_id "@"

}
