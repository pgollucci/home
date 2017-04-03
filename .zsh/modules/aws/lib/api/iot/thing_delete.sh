aws_iot_thing_delete() {
    local thing_name="$1"
    shift 1

    cond_log_and_run aws iot delete-thing --thing-name $thing_name "$@"
}
