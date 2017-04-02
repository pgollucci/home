aws_rds_db_subnet_group_modify() {
    local subnet-ids="$1"
    local db-subnet-group-name="$2"
    shift 2

    cond_log_and_run aws rds  --subnet-ids $subnet_ids --db-subnet-group-name $db_subnet_group_name "@"

}
