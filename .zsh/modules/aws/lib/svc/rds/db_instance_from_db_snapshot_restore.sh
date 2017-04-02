aws_rds_db_instance_from_db_snapshot_restore() {
    local db-instance-identifier="$1"
    local db-snapshot-identifier="$2"
    shift 2

    cond_log_and_run aws rds  --db-instance-identifier $db_instance_identifier --db-snapshot-identifier $db_snapshot_identifier "@"

}
