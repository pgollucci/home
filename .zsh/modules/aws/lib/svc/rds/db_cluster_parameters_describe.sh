aws_rds_db_cluster_parameters_describe() {
    local db-cluster-parameter-group-name="$1"
    shift 1

    log_and_run aws rds  --db-cluster-parameter-group-name $db_cluster_parameter_group_name "@"

}
