aws_rds_db_parameters_describe() {
    local db_parameter_group_name="$1"
    shift 1

    log_and_run aws rds describe-db-parameters --db-parameter-group-name $db_parameter_group_name "$@"
}
