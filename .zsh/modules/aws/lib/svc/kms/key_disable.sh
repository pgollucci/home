aws_kms_key_disable() {
    local key-id="$1"
    shift 1

    cond_log_and_run aws kms  --key-id $key_id "@"

}
