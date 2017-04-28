aws_elastictranscoder_preset_read() {
    local id="$1"
    shift 1

    cond_log_and_run aws elastictranscoder read-preset --id $id "$@"
}
