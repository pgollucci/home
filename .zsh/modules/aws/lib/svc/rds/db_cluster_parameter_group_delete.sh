aws_rds_db_cluster_parameter_group_delete() {
    local db-cluster-parameter-group-name="$1"
    shift 1

    cond_log_and_run aws rds  --db-cluster-parameter-group-name $db_cluster_parameter_group_name "@"

}
