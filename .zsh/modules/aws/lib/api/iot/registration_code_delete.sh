aws_iot_registration_code_delete() {
    shift 0

    cond_log_and_run aws iot delete-registration-code "$@"
}
