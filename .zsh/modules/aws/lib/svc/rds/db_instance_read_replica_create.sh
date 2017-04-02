aws_rds_db_instance_read_replica_create() {
    local source-db-instance-identifier="$1"
    local db-instance-identifier="$2"
    shift 2

    cond_log_and_run aws rds  --source-db-instance-identifier $source_db_instance_identifier --db-instance-identifier $db_instance_identifier "@"

}
