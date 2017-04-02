aws_rds_db_log_files_describe() {
    local db-instance-identifier="$1"
    shift 1

    log_and_run aws rds  --db-instance-identifier $db_instance_identifier "@"

}
