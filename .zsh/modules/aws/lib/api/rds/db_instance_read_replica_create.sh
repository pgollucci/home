aws_rds_db_instance_read_replica_create() {
    local db_instance_identifier="$1"
    local source_db_instance_identifier="$2"
    shift 2

    cond_log_and_run aws rds create-db-instance-read-replica --db-instance-identifier $db_instance_identifier --source-db-instance-identifier $source_db_instance_identifier "$@"
}
