aws_kms_alias_update() {
    local alias-name="$1"
    local target-key-id="$2"
    shift 2

    cond_log_and_run aws kms  --alias-name $alias_name --target-key-id $target_key_id "@"

}
