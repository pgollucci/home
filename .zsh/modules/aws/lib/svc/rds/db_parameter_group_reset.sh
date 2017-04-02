aws_rds_db_parameter_group_reset() {
    local db-parameter-group-name="$1"
    shift 1

    cond_log_and_run aws rds  --db-parameter-group-name $db_parameter_group_name "@"

}
