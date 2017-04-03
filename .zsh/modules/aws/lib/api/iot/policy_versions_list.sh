aws_iot_policy_versions_list() {
    local policy_name="$1"
    shift 1

    log_and_run aws iot list-policy-versions --policy-name $policy_name "$@"
}
