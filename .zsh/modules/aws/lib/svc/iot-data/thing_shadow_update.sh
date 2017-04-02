aws_iot-data_thing_shadow_update() {
    local payload="$1"
    local thing-name="$2"
    shift 2

    cond_log_and_run aws iot-data  --payload $payload --thing-name $thing_name "@"

}
