aws_rds_db_subnet_group_create() {
    local db-subnet-group-description="$1"
    local db-subnet-group-name="$2"
    local subnet-ids="$3"
    shift 3

    cond_log_and_run aws rds  --db-subnet-group-description $db_subnet_group_description --db-subnet-group-name $db_subnet_group_name --subnet-ids $subnet_ids "@"

}
