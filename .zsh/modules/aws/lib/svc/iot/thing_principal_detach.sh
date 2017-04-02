aws_iot_thing_principal_detach() {
    local principal="$1"
    local thing-name="$2"
    shift 2

    cond_log_and_run aws iot  --principal $principal --thing-name $thing_name "@"

}
