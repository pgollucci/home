aws_iot_thing_principal_attach() {
    local thing_name="$1"
    local principal="$2"
    shift 2

    cond_log_and_run aws iot attach-thing-principal --thing-name $thing_name --principal $principal "$@"
}
