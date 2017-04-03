aws_rds_db_engine_versions_describe() {
    shift 0

    log_and_run aws rds describe-db-engine-versions "$@"
}
