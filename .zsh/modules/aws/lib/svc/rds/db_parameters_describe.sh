aws_rds_db_parameters_describe() {
    local db-parameter-group-name="$1"
    shift 1

    log_and_run aws rds  --db-parameter-group-name $db_parameter_group_name "@"

}
