aws_kms_encrypt_re() {
    local ciphertext-blob="$1"
    local destination-key-id="$2"
    shift 2

    cond_log_and_run aws kms  --ciphertext-blob $ciphertext_blob --destination-key-id $destination_key_id "@"

}
