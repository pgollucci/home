aws_iot_data_thing_shadow_update() {
    local thing_name="$1"
    local payload="$2"
    shift 2

    cond_log_and_run aws iot-data update-thing-shadow --thing-name $thing_name --payload $payload "$@"
}
