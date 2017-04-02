aws_iot_thing_type_create() {
    local thing-type-name="$1"
    shift 1

    cond_log_and_run aws iot  --thing-type-name $thing_type_name "@"

}
