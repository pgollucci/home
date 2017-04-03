aws_kms_key_disable() {
    local key_id="$1"
    shift 1

    cond_log_and_run aws kms disable-key --key-id $key_id "$@"
}
