aws_ssm_associations_list() {
    shift 0

    log_and_run aws ssm list-associations "$@"
}
