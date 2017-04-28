aws_iot_thing_type_describe() {
    local thing_type_name="$1"
    shift 1

    log_and_run aws iot describe-thing-type --thing-type-name $thing_type_name "$@"
}
