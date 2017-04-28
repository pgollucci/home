aws_iot_thing_describe() {
    local thing_name="$1"
    shift 1

    log_and_run aws iot describe-thing --thing-name $thing_name "$@"
}
