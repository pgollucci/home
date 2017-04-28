aws_iot_thing_create() {
    local thing_name="$1"
    shift 1

    cond_log_and_run aws iot create-thing --thing-name $thing_name "$@"
}
