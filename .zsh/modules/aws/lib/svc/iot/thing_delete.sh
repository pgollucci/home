aws_iot_thing_delete() {
    local thing-name="$1"
    shift 1

    cond_log_and_run aws iot  --thing-name $thing_name "@"

}
