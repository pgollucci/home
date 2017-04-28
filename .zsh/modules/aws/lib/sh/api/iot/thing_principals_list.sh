aws_iot_thing_principals_list() {
    local thing_name="$1"
    shift 1

    log_and_run aws iot list-thing-principals --thing-name $thing_name "$@"
}
