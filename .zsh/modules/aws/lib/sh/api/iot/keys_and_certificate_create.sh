aws_iot_keys_and_certificate_create() {

    cond_log_and_run aws iot create-keys-and-certificate "$@"
}
