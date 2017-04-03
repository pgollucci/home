aws_rds_reserved_db_instances_offerings_describe() {
    shift 0

    log_and_run aws rds describe-reserved-db-instances-offerings "$@"
}
