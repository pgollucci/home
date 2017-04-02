aws_rds_db_cluster_from_snapshot_restore() {
    local engine="$1"
    local db-cluster-identifier="$2"
    local snapshot-identifier="$3"
    shift 3

    cond_log_and_run aws rds  --engine $engine --db-cluster-identifier $db_cluster_identifier --snapshot-identifier $snapshot_identifier "@"

}
