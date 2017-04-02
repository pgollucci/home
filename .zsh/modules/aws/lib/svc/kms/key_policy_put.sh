aws_kms_key_policy_put() {
    local policy-name="$1"
    local policy="$2"
    local key-id="$3"
    shift 3

    cond_log_and_run aws kms  --policy-name $policy_name --policy $policy --key-id $key_id "@"

}
