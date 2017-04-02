aws_rds_db_cluster_delete() {
    local db-cluster-identifier="$1"
    shift 1

    cond_log_and_run aws rds  --db-cluster-identifier $db_cluster_identifier "@"

}
