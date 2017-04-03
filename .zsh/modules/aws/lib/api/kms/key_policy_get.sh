aws_kms_key_policy_get() {
    local key_id="$1"
    local policy_name="$2"
    shift 2

    log_and_run aws kms get-key-policy --key-id $key_id --policy-name $policy_name "$@"
}
