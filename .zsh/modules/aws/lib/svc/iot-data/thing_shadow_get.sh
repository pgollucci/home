aws_iot-data_thing_shadow_get() {
    local thing-name="$1"
    shift 1

    log_and_run aws iot-data  --thing-name $thing_name "@"

}
