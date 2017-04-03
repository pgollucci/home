aws_rds_db_cluster_parameter_group_copy() {
    local source_db_cluster_parameter_group_identifier="$1"
    local target_db_cluster_parameter_group_identifier="$2"
    local target_db_cluster_parameter_group_description="$3"
    shift 3

    cond_log_and_run aws rds copy-db-cluster-parameter-group --source-db-cluster-parameter-group-identifier $source_db_cluster_parameter_group_identifier --target-db-cluster-parameter-group-identifier $target_db_cluster_parameter_group_identifier --target-db-cluster-parameter-group-description $target_db_cluster_parameter_group_description "$@"
}
