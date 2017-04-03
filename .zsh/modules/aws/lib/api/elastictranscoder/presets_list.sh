aws_elastictranscoder_presets_list() {
    shift 0

    log_and_run aws elastictranscoder list-presets "$@"
}
