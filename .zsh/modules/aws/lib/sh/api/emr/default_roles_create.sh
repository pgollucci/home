aws_emr_default_roles_create() {

    cond_log_and_run aws emr create-default-roles "$@"
}
