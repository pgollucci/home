aws_iot_thing_describe() {
    local thing-name="$1"
    shift 1

    log_and_run aws iot  --thing-name $thing_name "@"

}
