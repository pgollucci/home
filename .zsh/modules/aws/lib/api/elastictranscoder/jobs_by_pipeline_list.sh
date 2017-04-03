aws_elastictranscoder_jobs_by_pipeline_list() {
    local pipeline_id="$1"
    shift 1

    log_and_run aws elastictranscoder list-jobs-by-pipeline --pipeline-id $pipeline_id "$@"
}
