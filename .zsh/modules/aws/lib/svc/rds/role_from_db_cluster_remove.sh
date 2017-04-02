aws_rds_role_from_db_cluster_remove() {
    local db-cluster-identifier="$1"
    local role-arn="$2"
    shift 2

    cond_log_and_run aws rds  --db-cluster-identifier $db_cluster_identifier --role-arn $role_arn "@"

}
