aws_rds_db_clusters_describe() {
    shift 0

    log_and_run aws rds describe-db-clusters "$@"
}
