aws_iot_principal_policies_list() {
    local principal="$1"
    shift 1

    log_and_run aws iot  --principal $principal "@"

}
