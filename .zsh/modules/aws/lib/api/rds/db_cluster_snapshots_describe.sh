aws_rds_db_cluster_snapshots_describe() {
    shift 0

    log_and_run aws rds describe-db-cluster-snapshots "$@"
}
