aws_elastictranscoder_pipeline_read() {
    local id="$1"
    shift 1

    cond_log_and_run aws elastictranscoder  --id $id "@"

}
