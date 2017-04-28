aws_kms_alias_update() {
    local alias_name="$1"
    local target_key_id="$2"
    shift 2

    cond_log_and_run aws kms update-alias --alias-name $alias_name --target-key-id $target_key_id "$@"
}
