aws_opsworks-cm_cm_opsworks() {
    shift 0

    cond_log_and_run aws opsworks-cm  "@"

}
