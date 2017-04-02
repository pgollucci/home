aws_redshift_cluster_snapshot_copy() {
    local source-snapshot-identifier="$1"
    local target-snapshot-identifier="$2"
    shift 2

    cond_log_and_run aws redshift  --source-snapshot-identifier $source_snapshot_identifier --target-snapshot-identifier $target_snapshot_identifier "@"

}
