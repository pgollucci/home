aws_iot_principal_things_list() {
    local principal="$1"
    shift 1

    log_and_run aws iot  --principal $principal "@"

}
