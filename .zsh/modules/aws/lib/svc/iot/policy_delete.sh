aws_iot_policy_delete() {
    local policy-name="$1"
    shift 1

    cond_log_and_run aws iot  --policy-name $policy_name "@"

}
