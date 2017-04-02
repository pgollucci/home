aws_rds_db_cluster_parameter_group_create() {
    local description="$1"
    local db-parameter-group-family="$2"
    local db-cluster-parameter-group-name="$3"
    shift 3

    cond_log_and_run aws rds  --description $description --db-parameter-group-family $db_parameter_group_family --db-cluster-parameter-group-name $db_cluster_parameter_group_name "@"

}
