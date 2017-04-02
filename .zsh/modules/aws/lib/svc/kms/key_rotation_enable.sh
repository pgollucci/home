aws_kms_key_rotation_enable() {
    local key-id="$1"
    shift 1

    cond_log_and_run aws kms  --key-id $key_id "@"

}
