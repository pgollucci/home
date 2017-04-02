aws_rds_db_cluster_snapshot_attributes_describe() {
    local db-cluster-snapshot-identifier="$1"
    shift 1

    log_and_run aws rds  --db-cluster-snapshot-identifier $db_cluster_snapshot_identifier "@"

}
