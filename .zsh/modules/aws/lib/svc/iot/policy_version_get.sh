aws_iot_policy_version_get() {
    local policy-version-id="$1"
    local policy-name="$2"
    shift 2

    log_and_run aws iot  --policy-version-id $policy_version_id --policy-name $policy_name "@"

}
