aws_iot_default_policy_version_set() {
    local policy_name="$1"
    local policy_version_id="$2"
    shift 2

    cond_log_and_run aws iot set-default-policy-version --policy-name $policy_name --policy-version-id $policy_version_id "$@"
}
