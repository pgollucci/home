aws_rds_db_instance_to_point_in_time_restore() {
    local source_db_instance_identifier="$1"
    local target_db_instance_identifier="$2"
    shift 2

    cond_log_and_run aws rds restore-db-instance-to-point-in-time --source-db-instance-identifier $source_db_instance_identifier --target-db-instance-identifier $target_db_instance_identifier "$@"
}
