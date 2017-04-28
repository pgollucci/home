aws_elastictranscoder_preset_create() {
    local name="$1"
    local container="$2"
    shift 2

    cond_log_and_run aws elastictranscoder create-preset --name $name --container $container "$@"
}
