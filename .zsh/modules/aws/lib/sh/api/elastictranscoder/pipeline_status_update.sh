aws_elastictranscoder_pipeline_status_update() {
    local id="$1"
    local status="$2"
    shift 2

    cond_log_and_run aws elastictranscoder update-pipeline-status --id $id --status $status "$@"
}
