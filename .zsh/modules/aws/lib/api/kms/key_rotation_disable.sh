aws_kms_key_rotation_disable() {
    local key_id="$1"
    shift 1

    cond_log_and_run aws kms disable-key-rotation --key-id $key_id "$@"
}
