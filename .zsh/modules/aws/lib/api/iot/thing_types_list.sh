aws_iot_thing_types_list() {
    shift 0

    log_and_run aws iot list-thing-types "$@"
}
