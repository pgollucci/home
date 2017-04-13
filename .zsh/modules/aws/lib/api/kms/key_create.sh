aws_kms_key_create() {

    cond_log_and_run aws kms create-key "$@"
}
