aws_iot_policy_version_get() {
    local policy_name="$1"
    local policy_version_id="$2"
    shift 2

    log_and_run aws iot get-policy-version --policy-name $policy_name --policy-version-id $policy_version_id "$@"
}
