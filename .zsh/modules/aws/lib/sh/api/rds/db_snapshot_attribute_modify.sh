aws_rds_db_snapshot_attribute_modify() {
    local db_snapshot_identifier="$1"
    local attribute_name="$2"
    shift 2

    cond_log_and_run aws rds modify-db-snapshot-attribute --db-snapshot-identifier $db_snapshot_identifier --attribute-name $attribute_name "$@"
}
