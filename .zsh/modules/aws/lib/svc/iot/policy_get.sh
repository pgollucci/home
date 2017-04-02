aws_iot_policy_get() {
    local policy-name="$1"
    shift 1

    log_and_run aws iot  --policy-name $policy_name "@"

}
