aws_elastictranscoder_pipeline_notifications_update() {
    local id="$1"
    local notifications="$2"
    shift 2

    cond_log_and_run aws elastictranscoder  --id $id --notifications $notifications "@"

}
