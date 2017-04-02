aws_rds_db_cluster_snapshot_copy() {
    local source-db-cluster-snapshot-identifier="$1"
    local target-db-cluster-snapshot-identifier="$2"
    shift 2

    cond_log_and_run aws rds  --source-db-cluster-snapshot-identifier $source_db_cluster_snapshot_identifier --target-db-cluster-snapshot-identifier $target_db_cluster_snapshot_identifier "@"

}
