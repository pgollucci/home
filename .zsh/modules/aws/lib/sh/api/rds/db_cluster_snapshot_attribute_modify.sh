aws_rds_db_cluster_snapshot_attribute_modify() {
    local db_cluster_snapshot_identifier="$1"
    local attribute_name="$2"
    shift 2

    cond_log_and_run aws rds modify-db-cluster-snapshot-attribute --db-cluster-snapshot-identifier $db_cluster_snapshot_identifier --attribute-name $attribute_name "$@"
}
