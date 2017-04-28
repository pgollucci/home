aws_rds_db_subnet_group_modify() {
    local db_subnet_group_name="$1"
    local subnet_ids="$2"
    shift 2

    cond_log_and_run aws rds modify-db-subnet-group --db-subnet-group-name $db_subnet_group_name --subnet-ids $subnet_ids "$@"
}
