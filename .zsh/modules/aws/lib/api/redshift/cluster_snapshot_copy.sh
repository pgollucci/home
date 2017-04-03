aws_redshift_cluster_snapshot_copy() {
    local source_snapshot_identifier="$1"
    local target_snapshot_identifier="$2"
    shift 2

    cond_log_and_run aws redshift copy-cluster-snapshot --source-snapshot-identifier $source_snapshot_identifier --target-snapshot-identifier $target_snapshot_identifier "$@"
}
