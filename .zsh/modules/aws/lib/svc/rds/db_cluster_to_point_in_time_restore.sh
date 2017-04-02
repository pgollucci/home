aws_rds_db_cluster_to_point_in_time_restore() {
    local source-db-cluster-identifier="$1"
    local db-cluster-identifier="$2"
    shift 2

    cond_log_and_run aws rds  --source-db-cluster-identifier $source_db_cluster_identifier --db-cluster-identifier $db_cluster_identifier "@"

}
