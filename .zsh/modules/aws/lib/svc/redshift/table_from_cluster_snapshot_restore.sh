aws_redshift_table_from_cluster_snapshot_restore() {
    local source-table-name="$1"
    local new-table-name="$2"
    local cluster-identifier="$3"
    local source-database-name="$4"
    local snapshot-identifier="$5"
    shift 5

    cond_log_and_run aws redshift  --source-table-name $source_table_name --new-table-name $new_table_name --cluster-identifier $cluster_identifier --source-database-name $source_database_name --snapshot-identifier $snapshot_identifier "@"

}
