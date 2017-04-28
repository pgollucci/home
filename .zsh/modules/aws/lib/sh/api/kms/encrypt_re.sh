aws_kms_encrypt_re() {
    local ciphertext_blob="$1"
    local destination_key_id="$2"
    shift 2

    cond_log_and_run aws kms re-encrypt --ciphertext-blob $ciphertext_blob --destination-key-id $destination_key_id "$@"
}
