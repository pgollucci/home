aws_kms_key_enable() {
    local key_id="$1"
    shift 1

    cond_log_and_run aws kms enable-key --key-id $key_id "$@"
}
