aws_rds_db_parameter_group_copy() {
    local target-db-parameter-group-identifier="$1"
    local target-db-parameter-group-description="$2"
    local source-db-parameter-group-identifier="$3"
    shift 3

    cond_log_and_run aws rds  --target-db-parameter-group-identifier $target_db_parameter_group_identifier --target-db-parameter-group-description $target_db_parameter_group_description --source-db-parameter-group-identifier $source_db_parameter_group_identifier "@"

}
