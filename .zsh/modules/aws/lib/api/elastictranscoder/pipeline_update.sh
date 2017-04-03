aws_elastictranscoder_pipeline_update() {
    local id="$1"
    shift 1

    cond_log_and_run aws elastictranscoder update-pipeline --id $id "$@"
}
