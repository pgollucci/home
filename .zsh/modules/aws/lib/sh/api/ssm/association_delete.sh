aws_ssm_association_delete() {

    cond_log_and_run aws ssm delete-association "$@"
}
