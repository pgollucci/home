aws_rds_db_cluster_parameter_group_modify() {
    local db-cluster-parameter-group-name="$1"
    local parameters="$2"
    shift 2

    cond_log_and_run aws rds  --db-cluster-parameter-group-name $db_cluster_parameter_group_name --parameters $parameters "@"

}
