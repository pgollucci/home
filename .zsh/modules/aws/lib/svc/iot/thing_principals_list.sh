aws_iot_thing_principals_list() {
    local thing-name="$1"
    shift 1

    log_and_run aws iot  --thing-name $thing_name "@"

}
