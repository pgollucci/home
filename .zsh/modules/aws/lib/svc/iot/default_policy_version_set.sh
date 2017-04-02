aws_iot_default_policy_version_set() {
    local policy-name="$1"
    local policy-version-id="$2"
    shift 2

    cond_log_and_run aws iot  --policy-name $policy_name --policy-version-id $policy_version_id "@"

}
