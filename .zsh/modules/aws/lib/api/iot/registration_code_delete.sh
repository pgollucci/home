aws_iot_registration_code_delete() {

    cond_log_and_run aws iot delete-registration-code "$@"
}
