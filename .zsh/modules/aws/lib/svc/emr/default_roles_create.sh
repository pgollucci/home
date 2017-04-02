aws_emr_default_roles_create() {
    shift 0

    cond_log_and_run aws emr  "@"

}
