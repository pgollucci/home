aws_rds_db_cluster_snapshot_create() {
    local db_cluster_snapshot_identifier="$1"
    local db_cluster_identifier="$2"
    shift 2

    cond_log_and_run aws rds create-db-cluster-snapshot --db-cluster-snapshot-identifier $db_cluster_snapshot_identifier --db-cluster-identifier $db_cluster_identifier "$@"
}
