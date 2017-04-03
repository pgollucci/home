aws_redshift_table_from_cluster_snapshot_restore() {
    local cluster_identifier="$1"
    local snapshot_identifier="$2"
    local source_database_name="$3"
    local source_table_name="$4"
    local new_table_name="$5"
    shift 5

    cond_log_and_run aws redshift restore-table-from-cluster-snapshot --cluster-identifier $cluster_identifier --snapshot-identifier $snapshot_identifier --source-database-name $source_database_name --source-table-name $source_table_name --new-table-name $new_table_name "$@"
}
