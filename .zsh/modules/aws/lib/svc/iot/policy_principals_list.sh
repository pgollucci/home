aws_iot_policy_principals_list() {
    local policy-name="$1"
    shift 1

    log_and_run aws iot  --policy-name $policy_name "@"

}
