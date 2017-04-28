aws_rds_db_cluster_create() {
    local db_cluster_identifier="$1"
    local engine="$2"
    shift 2

    cond_log_and_run aws rds create-db-cluster --db-cluster-identifier $db_cluster_identifier --engine $engine "$@"
}
