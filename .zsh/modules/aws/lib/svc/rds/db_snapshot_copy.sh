aws_rds_db_snapshot_copy() {
    local source-db-snapshot-identifier="$1"
    local target-db-snapshot-identifier="$2"
    shift 2

    cond_log_and_run aws rds  --source-db-snapshot-identifier $source_db_snapshot_identifier --target-db-snapshot-identifier $target_db_snapshot_identifier "@"

}
