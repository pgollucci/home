aws_iot_thing_type_deprecate() {
    local thing_type_name="$1"
    shift 1

    cond_log_and_run aws iot deprecate-thing-type --thing-type-name $thing_type_name "$@"
}
