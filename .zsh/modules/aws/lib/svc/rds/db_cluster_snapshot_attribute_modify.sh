aws_rds_db_cluster_snapshot_attribute_modify() {
    local attribute-name="$1"
    local db-cluster-snapshot-identifier="$2"
    shift 2

    cond_log_and_run aws rds  --attribute-name $attribute_name --db-cluster-snapshot-identifier $db_cluster_snapshot_identifier "@"

}
