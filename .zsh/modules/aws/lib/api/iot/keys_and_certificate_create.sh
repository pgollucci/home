aws_iot_keys_and_certificate_create() {
    shift 0

    cond_log_and_run aws iot create-keys-and-certificate "$@"
}
