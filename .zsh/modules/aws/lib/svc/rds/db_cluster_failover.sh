aws_rds_db_cluster_failover() {
    shift 0

    cond_log_and_run aws rds  "@"

}
