aws_rds_db_cluster_snapshot_create() {
    local db-cluster-identifier="$1"
    local db-cluster-snapshot-identifier="$2"
    shift 2

    cond_log_and_run aws rds  --db-cluster-identifier $db_cluster_identifier --db-cluster-snapshot-identifier $db_cluster_snapshot_identifier "@"

}
