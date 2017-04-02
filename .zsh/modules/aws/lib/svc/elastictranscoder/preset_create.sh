aws_elastictranscoder_preset_create() {
    local name="$1"
    local container="$2"
    shift 2

    cond_log_and_run aws elastictranscoder  --name $name --container $container "@"

}
