aws_rds_db_subnet_group_delete() {
    local db-subnet-group-name="$1"
    shift 1

    cond_log_and_run aws rds  --db-subnet-group-name $db_subnet_group_name "@"

}
