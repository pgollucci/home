aws_kms_key_rotation_status_get() {
    local key-id="$1"
    shift 1

    log_and_run aws kms  --key-id $key_id "@"

}
