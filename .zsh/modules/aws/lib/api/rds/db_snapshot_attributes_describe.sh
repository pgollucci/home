aws_rds_db_snapshot_attributes_describe() {
    local db_snapshot_identifier="$1"
    shift 1

    log_and_run aws rds describe-db-snapshot-attributes --db-snapshot-identifier $db_snapshot_identifier "$@"
}
