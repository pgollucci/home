aws_iot_policy_create() {
    local policy-name="$1"
    local policy-document="$2"
    shift 2

    cond_log_and_run aws iot  --policy-name $policy_name --policy-document $policy_document "@"

}
