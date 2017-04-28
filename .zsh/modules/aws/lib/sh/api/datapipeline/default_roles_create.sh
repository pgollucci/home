aws_datapipeline_default_roles_create() {

    cond_log_and_run aws datapipeline create-default-roles "$@"
}
