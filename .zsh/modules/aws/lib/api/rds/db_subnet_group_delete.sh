aws_rds_db_subnet_group_delete() {
    local db_subnet_group_name="$1"
    shift 1

    cond_log_and_run aws rds delete-db-subnet-group --db-subnet-group-name $db_subnet_group_name "$@"
}
