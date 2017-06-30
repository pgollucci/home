aws_rds_db_instance_start() {
    local db_instance_identifier="$1"
    shift 1

    cond_log_and_run aws rds start-db-instance --db-instance-identifier $db_instance_identifier "$@"
}
