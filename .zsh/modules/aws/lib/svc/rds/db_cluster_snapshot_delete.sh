aws_rds_db_cluster_snapshot_delete() {
    local db-cluster-snapshot-identifier="$1"
    shift 1

    cond_log_and_run aws rds  --db-cluster-snapshot-identifier $db_cluster_snapshot_identifier "@"

}
