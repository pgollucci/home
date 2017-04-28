aws_rds_db_cluster_from_snapshot_restore() {
    local db_cluster_identifier="$1"
    local snapshot_identifier="$2"
    local engine="$3"
    shift 3

    cond_log_and_run aws rds restore-db-cluster-from-snapshot --db-cluster-identifier $db_cluster_identifier --snapshot-identifier $snapshot_identifier --engine $engine "$@"
}
