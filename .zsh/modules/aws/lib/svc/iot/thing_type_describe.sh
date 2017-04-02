aws_iot_thing_type_describe() {
    local thing-type-name="$1"
    shift 1

    log_and_run aws iot  --thing-type-name $thing_type_name "@"

}
