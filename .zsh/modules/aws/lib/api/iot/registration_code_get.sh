aws_iot_registration_code_get() {
    shift 0

    log_and_run aws iot get-registration-code "$@"
}
