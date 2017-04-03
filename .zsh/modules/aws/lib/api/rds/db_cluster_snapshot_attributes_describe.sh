aws_rds_db_cluster_snapshot_attributes_describe() {
    local db_cluster_snapshot_identifier="$1"
    shift 1

    log_and_run aws rds describe-db-cluster-snapshot-attributes --db-cluster-snapshot-identifier $db_cluster_snapshot_identifier "$@"
}
