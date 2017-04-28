aws_rds_db_instance_delete() {
    local db_instance_identifier="$1"
    shift 1

    cond_log_and_run aws rds delete-db-instance --db-instance-identifier $db_instance_identifier "$@"
}
