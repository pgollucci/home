aws_rds_db_snapshot_delete() {
    local db-snapshot-identifier="$1"
    shift 1

    cond_log_and_run aws rds  --db-snapshot-identifier $db_snapshot_identifier "@"

}
