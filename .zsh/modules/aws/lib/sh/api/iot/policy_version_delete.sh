aws_iot_policy_version_delete() {
    local policy_name="$1"
    local policy_version_id="$2"
    shift 2

    cond_log_and_run aws iot delete-policy-version --policy-name $policy_name --policy-version-id $policy_version_id "$@"
}
