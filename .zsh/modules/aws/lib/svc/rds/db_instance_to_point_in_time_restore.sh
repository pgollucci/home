aws_rds_db_instance_to_point_in_time_restore() {
    local source-db-instance-identifier="$1"
    local target-db-instance-identifier="$2"
    shift 2

    cond_log_and_run aws rds  --source-db-instance-identifier $source_db_instance_identifier --target-db-instance-identifier $target_db_instance_identifier "@"

}
