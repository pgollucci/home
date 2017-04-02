aws_ssm_association_delete() {
    shift 0

    cond_log_and_run aws ssm  "@"

}
