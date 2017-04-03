aws_rds_db_cluster_snapshot_delete() {
    local db_cluster_snapshot_identifier="$1"
    shift 1

    cond_log_and_run aws rds delete-db-cluster-snapshot --db-cluster-snapshot-identifier $db_cluster_snapshot_identifier "$@"
}
