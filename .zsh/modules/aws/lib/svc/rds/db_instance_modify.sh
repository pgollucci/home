aws_rds_db_instance_modify() {
    local db-instance-identifier="$1"
    shift 1

    cond_log_and_run aws rds  --db-instance-identifier $db_instance_identifier "@"

}
