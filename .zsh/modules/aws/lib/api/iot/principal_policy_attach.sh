aws_iot_principal_policy_attach() {
    local policy_name="$1"
    local principal="$2"
    shift 2

    cond_log_and_run aws iot attach-principal-policy --policy-name $policy_name --principal $principal "$@"
}
