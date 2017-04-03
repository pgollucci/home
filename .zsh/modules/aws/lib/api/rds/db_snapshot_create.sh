aws_rds_db_snapshot_create() {
    local db_snapshot_identifier="$1"
    local db_instance_identifier="$2"
    shift 2

    cond_log_and_run aws rds create-db-snapshot --db-snapshot-identifier $db_snapshot_identifier --db-instance-identifier $db_instance_identifier "$@"
}
