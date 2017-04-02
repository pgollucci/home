aws_rds_engine_default_cluster_parameters_describe() {
    local db-parameter-group-family="$1"
    shift 1

    log_and_run aws rds  --db-parameter-group-family $db_parameter_group_family "@"

}
