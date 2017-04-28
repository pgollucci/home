aws_rds_db_parameter_group_reset() {
    local db_parameter_group_name="$1"
    shift 1

    cond_log_and_run aws rds reset-db-parameter-group --db-parameter-group-name $db_parameter_group_name "$@"
}
