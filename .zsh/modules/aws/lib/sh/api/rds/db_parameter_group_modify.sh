aws_rds_db_parameter_group_modify() {
    local db_parameter_group_name="$1"
    local parameters="$2"
    shift 2

    cond_log_and_run aws rds modify-db-parameter-group --db-parameter-group-name $db_parameter_group_name --parameters $parameters "$@"
}
