aws_iot_data_thing_shadow_delete() {
    local thing_name="$1"
    shift 1

    cond_log_and_run aws iot-data delete-thing-shadow --thing-name $thing_name "$@"
}
