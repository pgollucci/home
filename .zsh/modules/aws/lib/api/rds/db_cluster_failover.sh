aws_rds_db_cluster_failover() {

    cond_log_and_run aws rds failover-db-cluster "$@"
}
