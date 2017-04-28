aws_iot_thing_principal_detach() {
    local thing_name="$1"
    local principal="$2"
    shift 2

    cond_log_and_run aws iot detach-thing-principal --thing-name $thing_name --principal $principal "$@"
}
