aws_rds_db_parameter_groups_describe() {
    shift 0

    log_and_run aws rds describe-db-parameter-groups "$@"
}
