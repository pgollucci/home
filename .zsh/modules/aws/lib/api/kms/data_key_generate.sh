aws_kms_data_key_generate() {
    local key_id="$1"
    shift 1

    cond_log_and_run aws kms generate-data-key --key-id $key_id "$@"
}
