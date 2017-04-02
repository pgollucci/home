aws_kms_key_policy_get() {
    local key-id="$1"
    local policy-name="$2"
    shift 2

    log_and_run aws kms  --key-id $key_id --policy-name $policy_name "@"

}
