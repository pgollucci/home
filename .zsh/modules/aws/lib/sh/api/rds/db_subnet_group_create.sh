aws_rds_db_subnet_group_create() {
    local db_subnet_group_name="$1"
    local db_subnet_group_description="$2"
    local subnet_ids="$3"
    shift 3

    cond_log_and_run aws rds create-db-subnet-group --db-subnet-group-name $db_subnet_group_name --db-subnet-group-description $db_subnet_group_description --subnet-ids $subnet_ids "$@"
}
