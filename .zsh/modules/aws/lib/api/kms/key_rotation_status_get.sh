aws_kms_key_rotation_status_get() {
    local key_id="$1"
    shift 1

    log_and_run aws kms get-key-rotation-status --key-id $key_id "$@"
}
