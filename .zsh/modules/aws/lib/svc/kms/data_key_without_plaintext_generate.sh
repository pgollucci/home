aws_kms_data_key_without_plaintext_generate() {
    local key-id="$1"
    shift 1

    cond_log_and_run aws kms  --key-id $key_id "@"

}
