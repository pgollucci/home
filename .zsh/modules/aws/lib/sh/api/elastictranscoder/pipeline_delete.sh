aws_elastictranscoder_pipeline_delete() {
    local id="$1"
    shift 1

    cond_log_and_run aws elastictranscoder delete-pipeline --id $id "$@"
}
