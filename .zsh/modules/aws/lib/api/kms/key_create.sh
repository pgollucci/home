aws_kms_key_create() {
    shift 0

    cond_log_and_run aws kms create-key "$@"
}
