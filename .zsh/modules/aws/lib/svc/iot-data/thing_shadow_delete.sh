aws_iot-data_thing_shadow_delete() {
    local thing-name="$1"
    shift 1

    cond_log_and_run aws iot-data  --thing-name $thing_name "@"

}
