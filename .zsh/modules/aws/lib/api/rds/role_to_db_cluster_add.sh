aws_rds_role_to_db_cluster_add() {
    local db_cluster_identifier="$1"
    local role_arn="$2"
    shift 2

    cond_log_and_run aws rds add-role-to-db-cluster --db-cluster-identifier $db_cluster_identifier --role-arn $role_arn "$@"
}
