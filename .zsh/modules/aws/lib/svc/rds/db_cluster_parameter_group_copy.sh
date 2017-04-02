aws_rds_db_cluster_parameter_group_copy() {
    local target-db-cluster-parameter-group-description="$1"
    local target-db-cluster-parameter-group-identifier="$2"
    local source-db-cluster-parameter-group-identifier="$3"
    shift 3

    cond_log_and_run aws rds  --target-db-cluster-parameter-group-description $target_db_cluster_parameter_group_description --target-db-cluster-parameter-group-identifier $target_db_cluster_parameter_group_identifier --source-db-cluster-parameter-group-identifier $source_db_cluster_parameter_group_identifier "@"

}
